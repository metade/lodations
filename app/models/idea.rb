class Idea < ActiveRecord::Base
  has_many :canned_queries
  
  def recommendation_count
    canned_queries.inject(0) {|sum, q| sum + q.recommendations.count }
  end
end
