class Resource < ActiveRecord::Base
  has_many :recommendations, :foreign_key => 'source_id'
  
  def self.with_most_recommendations
    Resource.find_by_sql('select resources.*, count(distinct canned_query_id) as score from resources join recommendations on source_id=resources.id group by recommendations.source_id order by score desc limit 10;')
  end
  
  def self.setup_by_uri_and_name(uri, name)
    resource = Resource.find_or_initialize_by_uri(uri)
    resource.update_attributes(:name => name) if resource.name != name
    resource
  end
  
  def gid
    return $1 if uri =~ %r[^http://www.bbc.co.uk/music/artists/([\w-]+)]
  end
end
