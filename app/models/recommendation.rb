class Recommendation < ActiveRecord::Base
  belongs_to :canned_query
  belongs_to :source, :class_name => 'Resource'
  belongs_to :destination, :class_name => 'Resource'
  
  def self.find_by_source_uri(uri)
    source = Resource.find_by_uri(uri)
    return [] if source.nil?
      
    CannedQuery.all.map do |query|
      find_by_sql(
        ['SELECT r.*, r1.score FROM recommendations AS r, (SELECT source_id, COUNT(source_id) AS score FROM recommendations GROUP BY source_id) AS r1 WHERE r.canned_query_id = ? AND r.source_id = ? AND r.destination_id = r1.source_id LIMIT 1;', query.id, source.id]
      )
    end.flatten.compact
  end
end
