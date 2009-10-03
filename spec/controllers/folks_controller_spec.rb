require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FolksController do

  def mock_folk(stubs={})
    @mock_folk ||= mock_model(Folk, stubs)
  end

  describe "GET show" do
    it "assigns the requested folk as @folk" do
      Folk.stub!(:find).with("37").and_return(mock_folk)
      get :show, :id => "37"
      assigns[:folk].should equal(mock_folk)
    end
  end

  describe "GET new" do
    it "assigns a new folk as @folk" do
      Folk.stub!(:new).and_return(mock_folk)
      get :new
      assigns[:folk].should equal(mock_folk)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created folk as @folk" do
        Folk.stub!(:find_or_create_by_name).with('folk_name').and_return(mock_folk(:valid? => true))
        post :create, :folk => {:name => 'params'}
        assigns[:folk].should equal(mock_folk)
      end

      it "redirects to the chat room lobbie" do
        Folk.stub!(:find_or_create_by_name).and_return(mock_folk(:valid? => true))
        post :create, :folk => {}
        response.should redirect_to(rooms_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved folk as @folk" do
        Folk.stub!(:find_or_create_by_name).with('').and_return(mock_folk(:valid? => false))
        post :create, :folk => {:name => ''}
        assigns[:folk].should equal(mock_folk)
      end

      it "re-renders the 'new' template" do
        Folk.stub!(:new).and_return(mock_folk(:valid? => false))
        post :create, :folk => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested folk" do
        Folk.should_receive(:find).with("37").and_return(mock_folk)
        mock_folk.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folk => {:these => 'params'}
      end

      it "assigns the requested folk as @folk" do
        Folk.stub!(:find).and_return(mock_folk(:update_attributes => true))
        put :update, :id => "1"
        assigns[:folk].should equal(mock_folk)
      end
    end

    describe "with invalid params" do
      it "updates the requested folk" do
        Folk.should_receive(:find).with("37").and_return(mock_folk)
        mock_folk.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :folk => {:these => 'params'}
      end

      it "assigns the folk as @folk" do
        Folk.stub!(:find).and_return(mock_folk(:update_attributes => false))
        put :update, :id => "1"
        assigns[:folk].should equal(mock_folk)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested folk" do
      Folk.should_receive(:find).with("37").and_return(mock_folk)
      mock_folk.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  end

end
