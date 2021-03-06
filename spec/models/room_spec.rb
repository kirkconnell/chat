require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Room do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Room.create!(@valid_attributes)
  end
  
  it "should find the ids of the online folks" do
    room = Room.new
    room.online_folks_ids.should_not be_nil
  end
  
end
