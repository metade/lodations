class CannedQuery < ActiveRecord::Base
  belongs_to :idea
  belongs_to :endpoint
  
  def execute(resource)
    sparql = self.sparql.gsub('@INPUT', "<#{resource.uri}>")
    results = endpoint.execute(sparql)
    
    result = results.rand
    ERB.new(template).result(binding)
  end
end
