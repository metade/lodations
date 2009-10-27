class PagesController < ApplicationController
  def index
    @resources = Resource.with_most_recommendations
  end
end
