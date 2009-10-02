require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Message do
  before(:each) do
    @valid_attributes = {
      :body => "value for body",
      :room_id => 1,
      :folk_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Message.create!(@valid_attributes)
  end
  
  describe "finding latest messages" do
    
    def heart_beat(stubs={})
      @heart_beat_mock ||= mock_model(HeartBeat, stubs)
    end
    
    def message(stubs={})
      @message_mock ||= mock_model(Message,stubs)
    end
    
    before(:each) do
      Message.stub!(:find).and_return([message])
      HeartBeat.stub!(:find).and_return(heart_beat(:touch => true, :updated_at => DateTime.now))
    end
    
    it "should find latest messages for a folk in a room" do
      Message.find_latest("37", "7").should == [message]
    end
    
    it "should timestamp the search" do
      heart_beat.should_receive(:touch)
      Message.find_latest("37", "7")
    end
    
  end
  
end
