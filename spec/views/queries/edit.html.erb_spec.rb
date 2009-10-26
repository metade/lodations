require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/queries/edit.html.erb" do
  include QueriesHelper

  before(:each) do
    assigns[:query] = @query = stub_model(Query,
      :new_record? => false,
      :sparql => "value for sparql"
    )
  end

  it "renders the edit query form" do
    render

    response.should have_tag("form[action=#{query_path(@query)}][method=post]") do
      with_tag('input#query_sparql[name=?]', "query[sparql]")
    end
  end
end
