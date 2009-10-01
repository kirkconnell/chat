require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoomsHelper do

  def mock_room(stubs={})
    @mock_room ||= mock_model(Room, stubs)
  end

  it "obtains current room name from show action" do
    helper.stub!(:action_name).and_return("show")
    assigns[:room] = mock_room(:name => "Room Name")
    helper.room_name.should == "Room Name"
  end
  
  it "displays 'Lobby' as the room title when in index action" do
    helper.stub!(:action_name).and_return("index")
    helper.room_name.should == "Lobby"
  end

end
