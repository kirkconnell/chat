require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesHelper do

  def mock_room(stubs={})
    @mock_room ||= mock_model(Room, stubs)
  end
  
  
  it "tells me if I'm looking for latest messages" do
    params[:folk_id] = "7"
    params[:room_id] = "37"
    
    helper.should be_looking_for_latest_messages
  end
  
  it "tells me when I'm not looking for latest messages" do
    params[:room_id] = "37"
    
    helper.should_not be_looking_for_latest_messages
  end
  
  describe "folks logging in" do
    
    before(:each) do
      session[:online] = [7]
      assigns[:room] = mock_room(:online_folks_ids => [1,7])
    end
  
    it "tells me if new folks arrived" do
      helper.new_folks_joined?.should == true
    end
  
    it "tells me the ids of the new folks online" do
      helper.new_folks_ids.should == [1]
    end
  
  end
  
  describe "folks going bye bye" do
    
    before(:each) do
      session[:online] = [1,7]
      assigns[:room] = mock_room(:online_folks_ids => [7])
    end
    
    it "tells me if some folks have left" do
      helper.some_folks_left?.should == true
    end
    
    it "tells me what folks left" do
      helper.deserter_folks_ids.should == [1]
    end
  end

end
