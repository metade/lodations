task :generate_recommendations => :environment do
  CannedQuery.all.each do |query|
    query.execute
  end
end

task :endpoints => :environment do
  Endpoint.create(:url => 'http://dbpedia.org/sparql', :title => 'DBpedia')
  Endpoint.create(:url => 'http://api.talis.com/stores/bbc-backstage/services/sparql', :title => 'Talis BBC Music/Programmes')
end

task :place => :environment do
  endpoint = Endpoint.find_by_url('http://api.talis.com/stores/bbc-backstage/services/sparql')
  idea = Idea.create(:title => 'Artists from the same place')
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
        ?place a ?place_type .

        FILTER (?place_type != <http://dbpedia.org/ontology/Country> && ?place_type != <http://dbpedia.org/class/yago/Country108544813>)
        FILTER (?source != ?destination)
        FILTER ( langMATCHES( lang(?place_name), 'en'))
      } 
      LIMIT 100
    ],
    :template => '<%= source.name %> and <%= link_to(destination.name, "/music/artists/#{destination.gid}") %> are both based in <%= result[5] %>'
  )
end
