class ResourcesController < ApplicationController
  def show
    uri = params[:id]
        
    @resource = RDFS::Resource.new(uri)
    @recommendations = CannedQuery.find(:all).map { |query| query.execute(@resource) }.compact
  end
end
