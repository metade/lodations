require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Recommendation do
  before(:each) do
    @valid_attributes = {
      :query_id => 1,
      :source_id => 1,
      :destination_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Recommendation.create!(@valid_attributes)
  end
end
