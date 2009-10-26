require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QueriesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "queries", :action => "index").should == "/queries"
    end

    it "maps #new" do
      route_for(:controller => "queries", :action => "new").should == "/queries/new"
    end

    it "maps #show" do
      route_for(:controller => "queries", :action => "show", :id => "1").should == "/queries/1"
    end

    it "maps #edit" do
      route_for(:controller => "queries", :action => "edit", :id => "1").should == "/queries/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "queries", :action => "create").should == {:path => "/queries", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "queries", :action => "update", :id => "1").should == {:path =>"/queries/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "queries", :action => "destroy", :id => "1").should == {:path =>"/queries/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/queries").should == {:controller => "queries", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/queries/new").should == {:controller => "queries", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/queries").should == {:controller => "queries", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/queries/1").should == {:controller => "queries", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/queries/1/edit").should == {:controller => "queries", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/queries/1").should == {:controller => "queries", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/queries/1").should == {:controller => "queries", :action => "destroy", :id => "1"}
    end
  end
end
