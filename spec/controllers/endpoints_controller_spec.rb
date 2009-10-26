require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EndpointsController do

  def mock_endpoint(stubs={})
    @mock_endpoint ||= mock_model(Endpoint, stubs)
  end

  describe "GET index" do
    it "assigns all endpoints as @endpoints" do
      Endpoint.stub!(:find).with(:all).and_return([mock_endpoint])
      get :index
      assigns[:endpoints].should == [mock_endpoint]
    end
  end

  describe "GET show" do
    it "assigns the requested endpoint as @endpoint" do
      Endpoint.stub!(:find).with("37").and_return(mock_endpoint)
      get :show, :id => "37"
      assigns[:endpoint].should equal(mock_endpoint)
    end
  end

  describe "GET new" do
    it "assigns a new endpoint as @endpoint" do
      Endpoint.stub!(:new).and_return(mock_endpoint)
      get :new
      assigns[:endpoint].should equal(mock_endpoint)
    end
  end

  describe "GET edit" do
    it "assigns the requested endpoint as @endpoint" do
      Endpoint.stub!(:find).with("37").and_return(mock_endpoint)
      get :edit, :id => "37"
      assigns[:endpoint].should equal(mock_endpoint)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created endpoint as @endpoint" do
        Endpoint.stub!(:new).with({'these' => 'params'}).and_return(mock_endpoint(:save => true))
        post :create, :endpoint => {:these => 'params'}
        assigns[:endpoint].should equal(mock_endpoint)
      end

      it "redirects to the created endpoint" do
        Endpoint.stub!(:new).and_return(mock_endpoint(:save => true))
        post :create, :endpoint => {}
        response.should redirect_to(endpoint_url(mock_endpoint))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved endpoint as @endpoint" do
        Endpoint.stub!(:new).with({'these' => 'params'}).and_return(mock_endpoint(:save => false))
        post :create, :endpoint => {:these => 'params'}
        assigns[:endpoint].should equal(mock_endpoint)
      end

      it "re-renders the 'new' template" do
        Endpoint.stub!(:new).and_return(mock_endpoint(:save => false))
        post :create, :endpoint => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested endpoint" do
        Endpoint.should_receive(:find).with("37").and_return(mock_endpoint)
        mock_endpoint.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :endpoint => {:these => 'params'}
      end

      it "assigns the requested endpoint as @endpoint" do
        Endpoint.stub!(:find).and_return(mock_endpoint(:update_attributes => true))
        put :update, :id => "1"
        assigns[:endpoint].should equal(mock_endpoint)
      end

      it "redirects to the endpoint" do
        Endpoint.stub!(:find).and_return(mock_endpoint(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(endpoint_url(mock_endpoint))
      end
    end

    describe "with invalid params" do
      it "updates the requested endpoint" do
        Endpoint.should_receive(:find).with("37").and_return(mock_endpoint)
        mock_endpoint.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :endpoint => {:these => 'params'}
      end

      it "assigns the endpoint as @endpoint" do
        Endpoint.stub!(:find).and_return(mock_endpoint(:update_attributes => false))
        put :update, :id => "1"
        assigns[:endpoint].should equal(mock_endpoint)
      end

      it "re-renders the 'edit' template" do
        Endpoint.stub!(:find).and_return(mock_endpoint(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested endpoint" do
      Endpoint.should_receive(:find).with("37").and_return(mock_endpoint)
      mock_endpoint.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the endpoints list" do
      Endpoint.stub!(:find).and_return(mock_endpoint(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(endpoints_url)
    end
  end

end
