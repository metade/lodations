require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EndpointsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "endpoints", :action => "index").should == "/endpoints"
    end

    it "maps #new" do
      route_for(:controller => "endpoints", :action => "new").should == "/endpoints/new"
    end

    it "maps #show" do
      route_for(:controller => "endpoints", :action => "show", :id => "1").should == "/endpoints/1"
    end

    it "maps #edit" do
      route_for(:controller => "endpoints", :action => "edit", :id => "1").should == "/endpoints/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "endpoints", :action => "create").should == {:path => "/endpoints", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "endpoints", :action => "update", :id => "1").should == {:path =>"/endpoints/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "endpoints", :action => "destroy", :id => "1").should == {:path =>"/endpoints/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/endpoints").should == {:controller => "endpoints", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/endpoints/new").should == {:controller => "endpoints", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/endpoints").should == {:controller => "endpoints", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/endpoints/1").should == {:controller => "endpoints", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/endpoints/1/edit").should == {:controller => "endpoints", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/endpoints/1").should == {:controller => "endpoints", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/endpoints/1").should == {:controller => "endpoints", :action => "destroy", :id => "1"}
    end
  end
end
