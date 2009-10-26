require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/endpoints/new.html.erb" do
  include EndpointsHelper

  before(:each) do
    assigns[:endpoint] = stub_model(Endpoint,
      :new_record? => true,
      :url => "value for url"
    )
  end

  it "renders new endpoint form" do
    render

    response.should have_tag("form[action=?][method=post]", endpoints_path) do
      with_tag("input#endpoint_url[name=?]", "endpoint[url]")
    end
  end
end
