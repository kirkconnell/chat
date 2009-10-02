require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesHelper do

  it "tells me if I'm looking for latest messages" do
    params[:folk_id] = "7"
    params[:room_id] = "37"
    
    helper.should be_looking_for_latest_messages
  end
  
  it "tells me when I'm not looking for latest messages" do
    params[:room_id] = "37"
    
    helper.should_not be_looking_for_latest_messages
  end

end
