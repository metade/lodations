require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Endpoint do
  before(:each) do
    @valid_attributes = {
      :url => "value for url"
    }
  end

  it "should create a new instance given valid attributes" do
    Endpoint.create!(@valid_attributes)
  end
end
