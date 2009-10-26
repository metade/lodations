require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/endpoints/edit.html.erb" do
  include EndpointsHelper

  before(:each) do
    assigns[:endpoint] = @endpoint = stub_model(Endpoint,
      :new_record? => false,
      :url => "value for url"
    )
  end

  it "renders the edit endpoint form" do
    render

    response.should have_tag("form[action=#{endpoint_path(@endpoint)}][method=post]") do
      with_tag('input#endpoint_url[name=?]', "endpoint[url]")
    end
  end
end
