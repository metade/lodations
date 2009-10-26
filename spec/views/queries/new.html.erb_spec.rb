require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/queries/new.html.erb" do
  include QueriesHelper

  before(:each) do
    assigns[:query] = stub_model(Query,
      :new_record? => true,
      :sparql => "value for sparql"
    )
  end

  it "renders new query form" do
    render

    response.should have_tag("form[action=?][method=post]", queries_path) do
      with_tag("input#query_sparql[name=?]", "query[sparql]")
    end
  end
end
