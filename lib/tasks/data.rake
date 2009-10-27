namespace :data do
  task :endpoints => :environment do
    Endpoint.create(:url => 'http://dbpedia.org/sparql', :title => 'DBpedia')
    Endpoint.create(:url => 'http://api.talis.com/stores/bbc-backstage/services/sparql', :title => 'Talis BBC Music/Programmes')
  end

  task :ideas => :environment do
    Idea.create(:title => 'Artists from the same place')
    Idea.create(:title => 'Artists signed to the same independent record label')
    Idea.create(:title => 'artists born in the same year?')
    Idea.create(:title => 'artists born on the same day?')
    Idea.create(:title => 'artists who played the same venues or festival?', :description => 'eg woodstock')
    Idea.create(:title => 'Artist who have used the same producer')
    Idea.create(:title => 'Artist who have used the same session artists', :description => 'what have Gram Parsons and Elvis Presley got in common? Glen Hardin - http://en.wikipedia.org/wiki/Glen_Hardin')
    Idea.create(:title => 'Artist who have used the same LP sleeve artist')
    Idea.create(:title => 'Artist who have appeared on same film soundtrack')
    Idea.create(:title => 'artists who have used the same studio')
    Idea.create(:title => 'artists who have used the same arranger(s)')
    Idea.create(:title => 'artists with same management or management company', :description => 'witchseason would be
    a good example')
  end

  task :place => :environment do
    endpoint = Endpoint.find_by_url('http://api.talis.com/stores/bbc-backstage/services/sparql')
    idea = Idea.find_by_title('Artists from the same place')
    idea.canned_queries.create(
      :title => 'using dbpedia:homeTown',
      :endpoint => endpoint,
      :sparql => %[
        SELECT ?source ?source_name ?destination ?destination_name ?place ?place_name
        WHERE {
          ?source <http://xmlns.com/foaf/0.1/name> ?source_name .
          ?source <http://www.w3.org/2002/07/owl#sameAs> ?dbpedia_source .
          ?destination <http://xmlns.com/foaf/0.1/name> ?destination_name .
          ?destination <http://www.w3.org/2002/07/owl#sameAs> ?dbpedia_destination .

          ?dbpedia_source <http://dbpedia.org/ontology/homeTown> ?place .
          ?dbpedia_destination <http://dbpedia.org/ontology/homeTown> ?place .

          ?place <http://www.w3.org/2000/01/rdf-schema#label> ?place_name .

          FILTER (
            (?place != <http://dbpedia.org/resource/France> && ?place != <http://dbpedia.org/resource/United_States>) &&
            (?source != ?destination) &&
            ( langMATCHES( lang(?place_name), 'en') )
          )
        }
      ],
      :template => '<%= source.name %> and <%= link_to(destination.name, "/music/artists/#{destination.gid}") %> are both based in <%= result[5] %>'
    )
  end

  task :independent_record_label => :environment do
    endpoint = Endpoint.find_by_url('http://api.talis.com/stores/bbc-backstage/services/sparql')
    idea = Idea.find_by_title('Artists signed to the same independent record label')
    idea.canned_queries.create(
      :title => 'using dbpedia:label',
      :endpoint => endpoint,
      :sparql => %[
        SELECT ?source ?source_name ?destination ?destination_name ?label ?label_name WHERE {
          ?source <http://xmlns.com/foaf/0.1/name> ?source_name .
          ?source <http://www.w3.org/2002/07/owl#sameAs> ?dbpedia_source .
          ?destination <http://xmlns.com/foaf/0.1/name> ?destination_name .
          ?destination <http://www.w3.org/2002/07/owl#sameAs> ?dbpedia_destination .

          ?dbpedia_source <http://dbpedia.org/ontology/label> ?label .
          ?dbpedia_destination <http://dbpedia.org/ontology/label> ?label .

          ?label 
            a <http://dbpedia.org/class/yago/IndependentRecordLabels> ;
            <http://xmlns.com/foaf/0.1/name> ?label_name ;

          FILTER (
            (?source != ?destination)
          )
        }
      ],
      :template => '<%= source.name %> and <%= link_to(destination.name, "/music/artists/#{destination.gid}") %> were both signed on <%= result[5] %>'
    )
  end

  task :queries => [:place, :independent_record_label]
  task :load => [:endpoints, :ideas, :queries]
end
