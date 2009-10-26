class Endpoint < ActiveRecord::Base
  has_many :canned_queries
  
  def execute(query)
    adapter = SparqlAdapter.new(:url => url, :engine => :virtuoso)
    adapter.query(query)
  end
end
