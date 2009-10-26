require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/endpoints/show.html.erb" do
  include EndpointsHelper
  before(:each) do
    assigns[:endpoint] = @endpoint = stub_model(Endpoint,
      :url => "value for url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ url/)
  end
end
