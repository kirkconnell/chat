require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FolksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "folks", :action => "index").should == "/folks"
    end

    it "maps #new" do
      route_for(:controller => "folks", :action => "new").should == "/folks/new"
    end

    it "maps #show" do
      route_for(:controller => "folks", :action => "show", :id => "1").should == "/folks/1"
    end

    it "maps #edit" do
      route_for(:controller => "folks", :action => "edit", :id => "1").should == "/folks/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "folks", :action => "create").should == {:path => "/folks", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "folks", :action => "update", :id => "1").should == {:path =>"/folks/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "folks", :action => "destroy", :id => "1").should == {:path =>"/folks/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/folks").should == {:controller => "folks", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/folks/new").should == {:controller => "folks", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/folks").should == {:controller => "folks", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/folks/1").should == {:controller => "folks", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/folks/1/edit").should == {:controller => "folks", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/folks/1").should == {:controller => "folks", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/folks/1").should == {:controller => "folks", :action => "destroy", :id => "1"}
    end
  end
end
