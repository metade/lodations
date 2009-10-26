class ResourcesController < ApplicationController
  def show
    uri = params[:id]
        
    # p STORE.load(uri)
    resource = RDFS::Resource.new(uri)
    
    CannedQuery.find(:all).each do |query|
      sparql = query.sparql.gsub('@INPUT', "<#{uri}>")
      p query.endpoint.execute(sparql)
    end
  end
end
