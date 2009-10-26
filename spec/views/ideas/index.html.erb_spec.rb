require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ideas/index.html.erb" do
  include IdeasHelper

  before(:each) do
    assigns[:ideas] = [
      stub_model(Idea,
        :title => "value for title",
        :description => "value for description"
      ),
      stub_model(Idea,
        :title => "value for title",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of ideas" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
