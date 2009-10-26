require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IdeasController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "ideas", :action => "index").should == "/ideas"
    end

    it "maps #new" do
      route_for(:controller => "ideas", :action => "new").should == "/ideas/new"
    end

    it "maps #show" do
      route_for(:controller => "ideas", :action => "show", :id => "1").should == "/ideas/1"
    end

    it "maps #edit" do
      route_for(:controller => "ideas", :action => "edit", :id => "1").should == "/ideas/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "ideas", :action => "create").should == {:path => "/ideas", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "ideas", :action => "update", :id => "1").should == {:path =>"/ideas/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "ideas", :action => "destroy", :id => "1").should == {:path =>"/ideas/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/ideas").should == {:controller => "ideas", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/ideas/new").should == {:controller => "ideas", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/ideas").should == {:controller => "ideas", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/ideas/1").should == {:controller => "ideas", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/ideas/1/edit").should == {:controller => "ideas", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/ideas/1").should == {:controller => "ideas", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/ideas/1").should == {:controller => "ideas", :action => "destroy", :id => "1"}
    end
  end
end
