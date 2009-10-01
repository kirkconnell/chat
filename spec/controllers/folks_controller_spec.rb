require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FolksController do

  def mock_folk(stubs={})
    @mock_folk ||= mock_model(Folk, stubs)
  end

  describe "GET index" do
    it "assigns all folks as @folks" do
      Folk.stub!(:find).with(:all).and_return([mock_folk])
      get :index
      assigns[:folks].should == [mock_folk]
    end
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

  describe "GET edit" do
    it "assigns the requested folk as @folk" do
      Folk.stub!(:find).with("37").and_return(mock_folk)
      get :edit, :id => "37"
      assigns[:folk].should equal(mock_folk)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created folk as @folk" do
        Folk.stub!(:new).with({'these' => 'params'}).and_return(mock_folk(:save => true))
        post :create, :folk => {:these => 'params'}
        assigns[:folk].should equal(mock_folk)
      end

      it "redirects to the created folk" do
        Folk.stub!(:new).and_return(mock_folk(:save => true))
        post :create, :folk => {}
        response.should redirect_to(folk_url(mock_folk))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved folk as @folk" do
        Folk.stub!(:new).with({'these' => 'params'}).and_return(mock_folk(:save => false))
        post :create, :folk => {:these => 'params'}
        assigns[:folk].should equal(mock_folk)
      end

      it "re-renders the 'new' template" do
        Folk.stub!(:new).and_return(mock_folk(:save => false))
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

      it "redirects to the folk" do
        Folk.stub!(:find).and_return(mock_folk(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(folk_url(mock_folk))
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

      it "re-renders the 'edit' template" do
        Folk.stub!(:find).and_return(mock_folk(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested folk" do
      Folk.should_receive(:find).with("37").and_return(mock_folk)
      mock_folk.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the folks list" do
      Folk.stub!(:find).and_return(mock_folk(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(folks_url)
    end
  end

end
