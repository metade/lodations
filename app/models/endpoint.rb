class Endpoint < ActiveRecord::Base
  
  def execute(query)
    adapter = SparqlAdapter.new(:url => url, :engine => :virtuoso)
    adapter.query(query)
    
  end
  
end
