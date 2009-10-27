# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_resource(resource)
    link_to(resource.name, "/music/artists/#{resource.gid}")
  end
end
