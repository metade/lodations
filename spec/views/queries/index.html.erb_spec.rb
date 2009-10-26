require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/queries/index.html.erb" do
  include QueriesHelper

  before(:each) do
    assigns[:queries] = [
      stub_model(Query,
        :sparql => "value for sparql"
      ),
      stub_model(Query,
        :sparql => "value for sparql"
      )
    ]
  end

  it "renders a list of queries" do
    render
    response.should have_tag("tr>td", "value for sparql".to_s, 2)
  end
end
