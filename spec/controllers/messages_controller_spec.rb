require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do

  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs)
  end
  
  describe "GET index with no params" do
    it "assigns all messages as @messages" do
      Message.stub!(:find).with(:all).and_return([mock_message])
      get :index
      assigns[:messages].should == [mock_message]
    end
  end
  
  describe "Get index with room and folk params" do
    def mock_room(stubs={})
      @mock_room ||= mock_model(Room, stubs)
    end
    
    before(:each) do
      Message.stub!(:find_latest).with("37", "7").and_return([mock_message(:id => "37")])
      Room.stub!(:find).with("37").and_return(mock_room)
    end
    
    
    it "gets latest messages for room and folk" do
      get :index, :room_id => "37", :folk_id => "7"
      assigns[:messages].should == [mock_message]
    end
    
    it "assigns the room to which the query belongs to @room" do
      get :index, :room_id => "37", :folk_id => "7"
      assigns[:room].should == mock_room
    end
    
  end

  describe "GET show" do
    it "assigns the requested message as @message" do
      Message.stub!(:find).with("37").and_return(mock_message)
      get :show, :id => "37"
      assigns[:message].should equal(mock_message)
    end
  end
  
  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created message as @message" do
        Message.stub!(:new).with({'these' => 'params'}).and_return(mock_message(:save => true))
        post :create, :message => {:these => 'params'}
        assigns[:message].should equal(mock_message)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      Message.should_receive(:find).with("37").and_return(mock_message)
      mock_message.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  end

end
