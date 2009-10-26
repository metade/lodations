require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/endpoints/index.html.erb" do
  include EndpointsHelper

  before(:each) do
    assigns[:endpoints] = [
      stub_model(Endpoint,
        :url => "value for url"
      ),
      stub_model(Endpoint,
        :url => "value for url"
      )
    ]
  end

  it "renders a list of endpoints" do
    render
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end
