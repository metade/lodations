class MusicController < ApplicationController
  def show
    path = params[:path]
    
    if path =~ /false$/
      render(:text => ' ', :layout => false)
      return 
    end
    
    doc = Hpricot(open("http://www.bbc.co.uk/music/#{path}"))
    (doc/'//link').each { |link| link['href'] = "http://www.bbc.co.uk#{link['href']}"}
    (doc/'//img').each { |img| img['src'] = "http://www.bbc.co.uk#{img['src']}"}
    (doc/'//script').each { |script| script['src'] = "http://www.bbc.co.uk#{script['src']}" if script['src'] =~ %r[^/] }
  
    if path =~ %r[artists/([\w-]+)$]
      gid = $1
      recommendations = Recommendation.find_by_source_uri("http://www.bbc.co.uk/music/artists/#{gid}#artist")
      if recommendations.any?
        div = (doc/'//div#bbc_related_content').first
        div.children.first.before %[
          <div class="container" id="recommendations">
          <h2><a href="/">LODations</a> Recommendations</h2>
              <ul id="links-list">
                  #{ recommendations.map { |r| "<li>#{r.message}</li>" } } 
              </ul>
              <p class="box disclaimer mb_font">These recommendations are generated using Linked Data with <a href="/">LODations</a>.</p>
          </div>
        ]
      end
    end
    
    string = doc.to_s
    string.gsub!("'/includes/", "'http://www.bbc.co.uk/includes")
    string.gsub!("\"/includes/", "\"http://www.bbc.co.uk/includes")
    render(:text => string, :layout => false)
  end
end
