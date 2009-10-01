require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RoomsController do

  def mock_room(stubs={})
    @mock_room ||= mock_model(Room, stubs)
  end
  
  def mock_current_folk(stubs={})
    @mock_current_folk ||= mock_model(Folk, stubs)
  end

  describe "GET index" do
    it "assigns all rooms as @rooms" do
      Room.stub!(:find).with(:all).and_return([mock_room])
      Folk.stub!(:find).with("7").and_return(mock_current_folk)
      
      get :index, :folk => "7"
      assigns[:rooms].should == [mock_room]
    end
    
    it "assigns current folk as @folk" do
      Folk.stub!(:find).with("7").and_return(mock_current_folk)
      get :index, :folk => "7"
      assigns[:folk].should equal(mock_current_folk)
    end
    
  end

  describe "GET show" do
    it "assigns the requested room as @room" do
      Room.stub!(:find).with("37").and_return(mock_room)
      Folk.stub!(:find).with("7").and_return(mock_current_folk)
      get :show, :id => "37", :folk => "7"
      assigns[:room].should equal(mock_room)
      assigns[:folk].should equal(mock_current_folk)
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
