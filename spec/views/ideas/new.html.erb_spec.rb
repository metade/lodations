require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ideas/new.html.erb" do
  include IdeasHelper

  before(:each) do
    assigns[:idea] = stub_model(Idea,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders new idea form" do
    render

    response.should have_tag("form[action=?][method=post]", ideas_path) do
      with_tag("input#idea_title[name=?]", "idea[title]")
      with_tag("input#idea_description[name=?]", "idea[description]")
    end
  end
end
