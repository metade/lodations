class Resource < ActiveRecord::Base
  
  def self.setup_by_uri_and_name(uri, name)
    resource = Resource.find_or_initialize_by_uri(uri)
    resource.update_attributes(:name => name) if resource.name != name
    resource
  end
  
  def gid
    return $1 if uri =~ %r[^http://www.bbc.co.uk/music/artists/([\w-]+)]
  end
end
