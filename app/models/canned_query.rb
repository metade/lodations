class CannedQuery < ActiveRecord::Base
  belongs_to :idea
  belongs_to :endpoint
  has_many :recommendations, :dependent => :destroy
  has_many :best_recommendations, :class_name => 'Recommendation', :limit => 10
  
  def execute
    recommendations.clear
    
    results = endpoint.execute(sparql + " LIMIT #{SPARQL_LIMIT}")
    results.each do |result|
      s_uri, s_name, d_uri, d_name = result[0].uri, result[1], result[2].uri, result[3]
      source = Resource.setup_by_uri_and_name(s_uri, s_name)
      destination = Resource.setup_by_uri_and_name(d_uri, d_name)
      
      message = ERB.new(template).result(binding)
      recommendations.create(
        :source => source,
        :destination => destination,
        :message => message
      )
    end
  end
  
  protected
  
  def link_to(name, link)
    %[<a href="#{link}">#{name}</a>]
  end
end
