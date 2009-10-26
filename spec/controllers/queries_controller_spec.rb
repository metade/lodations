require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QueriesController do

  def mock_query(stubs={})
    @mock_query ||= mock_model(Query, stubs)
  end

  describe "GET index" do
    it "assigns all queries as @queries" do
      Query.stub!(:find).with(:all).and_return([mock_query])
      get :index
      assigns[:queries].should == [mock_query]
    end
  end

  describe "GET show" do
    it "assigns the requested query as @query" do
      Query.stub!(:find).with("37").and_return(mock_query)
      get :show, :id => "37"
      assigns[:query].should equal(mock_query)
    end
  end

  describe "GET new" do
    it "assigns a new query as @query" do
      Query.stub!(:new).and_return(mock_query)
      get :new
      assigns[:query].should equal(mock_query)
    end
  end

  describe "GET edit" do
    it "assigns the requested query as @query" do
      Query.stub!(:find).with("37").and_return(mock_query)
      get :edit, :id => "37"
      assigns[:query].should equal(mock_query)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created query as @query" do
        Query.stub!(:new).with({'these' => 'params'}).and_return(mock_query(:save => true))
        post :create, :query => {:these => 'params'}
        assigns[:query].should equal(mock_query)
      end

      it "redirects to the created query" do
        Query.stub!(:new).and_return(mock_query(:save => true))
        post :create, :query => {}
        response.should redirect_to(query_url(mock_query))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved query as @query" do
        Query.stub!(:new).with({'these' => 'params'}).and_return(mock_query(:save => false))
        post :create, :query => {:these => 'params'}
        assigns[:query].should equal(mock_query)
      end

      it "re-renders the 'new' template" do
        Query.stub!(:new).and_return(mock_query(:save => false))
        post :create, :query => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested query" do
        Query.should_receive(:find).with("37").and_return(mock_query)
        mock_query.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :query => {:these => 'params'}
      end

      it "assigns the requested query as @query" do
        Query.stub!(:find).and_return(mock_query(:update_attributes => true))
        put :update, :id => "1"
        assigns[:query].should equal(mock_query)
      end

      it "redirects to the query" do
        Query.stub!(:find).and_return(mock_query(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(query_url(mock_query))
      end
    end

    describe "with invalid params" do
      it "updates the requested query" do
        Query.should_receive(:find).with("37").and_return(mock_query)
        mock_query.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :query => {:these => 'params'}
      end

      it "assigns the query as @query" do
        Query.stub!(:find).and_return(mock_query(:update_attributes => false))
        put :update, :id => "1"
        assigns[:query].should equal(mock_query)
      end

      it "re-renders the 'edit' template" do
        Query.stub!(:find).and_return(mock_query(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested query" do
      Query.should_receive(:find).with("37").and_return(mock_query)
      mock_query.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the queries list" do
      Query.stub!(:find).and_return(mock_query(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(queries_url)
    end
  end

end
