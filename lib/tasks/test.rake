
task :play => :environment do
  endpoint = Endpoint.create(:url => 'http://dbpedia.org/sparql', :title => 'DBpedia')
  Endpoint.create(:url => 'http://api.talis.com/stores/bbc-backstage/services/sparql', :title => 'Talis BBC Music/Programmes')
  
  idea = Idea.create(:title => 'Artists from the same place')
  idea.canned_queries.create(
    :title => 'using dbpedia:homeTown',
    :endpoint => endpoint,
    :sparql => %[
      SELECT ?input_name, ?OUTPUT, ?output_name, ?place_name
          WHERE {
            @INPUT <http://dbpedia.org/ontology/homeTown> ?place .
            @INPUT <http://xmlns.com/foaf/0.1/name> ?input_name .
            ?place rdfs:label ?place_name .
            ?OUTPUT <http://dbpedia.org/ontology/homeTown> ?place .
            ?OUTPUT <http://xmlns.com/foaf/0.1/name> ?output_name .
            FILTER (@INPUT != ?OUTPUT)
            FILTER ( langMATCHES( lang(?place_name), 'en'))
          }    
    ],
    :template => '<%= result[0] %> and <a href="/resources/<%= result[1].uri %>"><%= result[2] %></a> are both based in <%= result[3] %>'
  )
  
  idea = Idea.create(:title => 'Artists signed to the same independent record label')
  idea.canned_queries.create(
    :title => 'using dbpedia#label',
    :endpoint => endpoint,
    :sparql => %[
      SELECT ?input_name, ?output_name, ?label_name, ?abstract WHERE {
              @INPUT
                <http://dbpedia.org/ontology/label> ?label ;
                <http://dbpedia.org/property/name> ?input_name .
              ?OUTPUT
                 <http://dbpedia.org/ontology/label> ?label ;
                <http://dbpedia.org/property/name> ?output_name .
              ?label
                <http://xmlns.com/foaf/0.1/name> ?label_name ;
                a <http://dbpedia.org/class/yago/IndependentRecordLabels> ;
                <http://dbpedia.org/property/abstract> ?abstract .
              FILTER (
                (@INPUT != ?OUTPUT) &&
                (langMatches(lang(?abstract), 'en') || lang(?abstract) = '' )
              )
            }
     ],
    :template => '<%= result[0] %> and <a href="/resources/<%= result[1].uri %>"><%= result[2] %></a> were both signed on <%= result[3] %>. <%= result[4] %>'
  )
  
  idea = Idea.create(:title => 'artists born in the same year?')
  idea = Idea.create(:title => 'artists born on the same day?')
  idea = Idea.create(:title => 'artists who played the same venues or festival?', :description => 'eg woodstock')
  idea = Idea.create(:title => 'Artist who have used the same producer')
  idea = Idea.create(:title => 'Artist who have used the same session artists', :description => 'what have Gram Parsons and Elvis Presley got in common? Glen Hardin - http://en.wikipedia.org/wiki/Glen_Hardin')
  idea = Idea.create(:title => 'Artist who have used the same LP sleeve artist')
  idea = Idea.create(:title => 'Artist who have appeared on same film soundtrack')
  idea = Idea.create(:title => 'artists who have used the same studio')
  idea = Idea.create(:title => 'artists who have used the same arranger(s)')
  idea = Idea.create(:title => 'artists with same management or management company', :description => 'witchseason would be
a good example')
end
