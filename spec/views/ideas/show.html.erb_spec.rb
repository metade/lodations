require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ideas/show.html.erb" do
  include IdeasHelper
  before(:each) do
    assigns[:idea] = @idea = stub_model(Idea,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
  end
end
