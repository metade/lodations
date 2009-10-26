require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/queries/show.html.erb" do
  include QueriesHelper
  before(:each) do
    assigns[:query] = @query = stub_model(Query,
      :sparql => "value for sparql"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ sparql/)
  end
end
