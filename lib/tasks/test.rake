
task :play => :environment do
  endpoint = Endpoint.create(:url => 'http://dbpedia.org/sparql', :title => 'DBpedia')
  
  idea = Idea.create(:title => 'Recommend artists that come from the same place')
  idea.canned_queries.create(
    :title => 'foo',
    :endpoint => endpoint,
    :sparql => %[
      SELECT *
          WHERE {
            @INPUT <http://dbpedia.org/ontology/homeTown> ?place .
            @INPUT <http://dbpedia.org/property/name> ?input_name .
            ?place rdfs:label ?place_name .
            ?OUTPUT <http://dbpedia.org/ontology/homeTown> ?place .
            ?OUTPUT <http://dbpedia.org/property/name> ?output_name .
            FILTER (@INPUT != ?OUTPUT)
            FILTER ( langMATCHES( lang(?place_name), 'en') )
          }
    ],
    :template => '<%= result["input_name"] %> and <%= result["output_name"] %> are both based in Detroit'
  )
end
