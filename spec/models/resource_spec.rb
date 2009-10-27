require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Resource do
  before(:each) do
    @valid_attributes = {
      :gid => "value for gid",
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Resource.create!(@valid_attributes)
  end
end
