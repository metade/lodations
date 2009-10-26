
task :play => :environment do
  endpoint = Endpoint.create(:url => 'http://dbpedia.org/sparql', :title => 'DBpedia')
  
  idea = Idea.create(:title => 'Recommend artists that come from the same place')
  idea.canned_queries.create(
    :title => 'foo',
    :endpoint => endpoint,
    :sparql => %[
      SELECT ?input_name, ?output_name, ?place_name
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
    :template => '<%= result[0] %> and <%= result[1] %> are both based in <%= result[2] %>'
  )
end
