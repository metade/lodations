require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ideas/edit.html.erb" do
  include IdeasHelper

  before(:each) do
    assigns[:idea] = @idea = stub_model(Idea,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders the edit idea form" do
    render

    response.should have_tag("form[action=#{idea_path(@idea)}][method=post]") do
      with_tag('input#idea_title[name=?]', "idea[title]")
      with_tag('input#idea_description[name=?]', "idea[description]")
    end
  end
end
