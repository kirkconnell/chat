require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoomsController do

  def mock_room(stubs={})
    @mock_room ||= mock_model(Room, stubs)
  end
  
  def mock_current_folk(stubs={})
    @mock_current_folk ||= mock_model(Folk, stubs)
  end

  describe "GET index" do
    before(:each) do
      Folk.stub!(:find).with("7").and_return(mock_current_folk)
    end
    
    it "assigns all rooms as @rooms" do
      Room.stub!(:find).with(:all).and_return([mock_room])
      
      get :index, :folk => "7"
      assigns[:rooms].should == [mock_room]
    end
    
    it "assigns current folk as @folk" do
      get :index, :folk => "7"
      assigns[:folk].should equal(mock_current_folk)
    end
    
  end

  describe "GET show" do

    def mock_heart_beat(stubs={})
      @mock_heart_beat ||= mock_model(HeartBeat, stubs)
    end
    
    before(:each) do
      Room.stub!(:find).with("37").and_return(mock_room(:id => 37))
      Folk.stub!(:find).with("7").and_return(mock_current_folk(:id => 7))
      mock_room.stub!(:online_folks_ids).and_return([7])
      mock_heart_beat.stub!(:touch).and_return(true)
    end
    
    it "assigns the selected room to @room" do
      get :show, :id => "37", :folk => "7"
      assigns[:room].should equal(mock_room)
    end
    
    it "assigns the current folk to @folk" do
      get :show, :id => "37", :folk => "7"
      assigns[:folk].should equal(mock_current_folk)
    end
    
    it "assigns an empty message ready to be filled to @message" do
      get :show, :id => "37", :folk => "7"
      assigns[:message].should be_instance_of(Message)
      assigns[:message].room_id.should == mock_room.id
      assigns[:message].folk_id.should == mock_current_folk.id
      assigns[:message].should be_new_record
    end
    
    it "stores the heart beat for the folk" do
      HeartBeat.stub!(:find_or_create_by_folk_id_and_room_id).with("7", "37").and_return(mock_heart_beat)
      HeartBeat.should_receive(:find_or_create_by_folk_id_and_room_id).with("7", "37").and_return(mock_heart_beat)
      get :show, :id => "37", :folk => "7"
    end
    
    it "stores in the session the online folks" do
      get :show, :id => "37", :folk => "7"
      session[:online].should == [7]
    end
    
  end


  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created room as @room" do
        Room.stub!(:new).with({'these' => 'params'}).and_return(mock_room(:save => true))
        post :create, :room => {:these => 'params'}
        assigns[:room].should equal(mock_room)
      end

      it "redirects to the created room" do
        Room.stub!(:new).and_return(mock_room(:save => true))
        post :create, :room => {}
        response.should redirect_to(room_url(mock_room))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        Room.stub!(:new).with({'these' => 'params'}).and_return(mock_room(:save => false))
        post :create, :room => {:these => 'params'}
        assigns[:room].should equal(mock_room)
      end

      it "re-renders the 'new' template" do
        Room.stub!(:new).and_return(mock_room(:save => false))
        post :create, :room => {}
        response.should render_template('new')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested room" do
      Room.should_receive(:find).with("37").and_return(mock_room)
      mock_room.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rooms list" do
      Room.stub!(:find).and_return(mock_room(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(rooms_url)
    end
  end

end
