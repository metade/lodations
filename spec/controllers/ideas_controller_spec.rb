require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IdeasController do

  def mock_idea(stubs={})
    @mock_idea ||= mock_model(Idea, stubs)
  end

  describe "GET index" do
    it "assigns all ideas as @ideas" do
      Idea.stub!(:find).with(:all).and_return([mock_idea])
      get :index
      assigns[:ideas].should == [mock_idea]
    end
  end

  describe "GET show" do
    it "assigns the requested idea as @idea" do
      Idea.stub!(:find).with("37").and_return(mock_idea)
      get :show, :id => "37"
      assigns[:idea].should equal(mock_idea)
    end
  end

  describe "GET new" do
    it "assigns a new idea as @idea" do
      Idea.stub!(:new).and_return(mock_idea)
      get :new
      assigns[:idea].should equal(mock_idea)
    end
  end

  describe "GET edit" do
    it "assigns the requested idea as @idea" do
      Idea.stub!(:find).with("37").and_return(mock_idea)
      get :edit, :id => "37"
      assigns[:idea].should equal(mock_idea)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created idea as @idea" do
        Idea.stub!(:new).with({'these' => 'params'}).and_return(mock_idea(:save => true))
        post :create, :idea => {:these => 'params'}
        assigns[:idea].should equal(mock_idea)
      end

      it "redirects to the created idea" do
        Idea.stub!(:new).and_return(mock_idea(:save => true))
        post :create, :idea => {}
        response.should redirect_to(idea_url(mock_idea))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved idea as @idea" do
        Idea.stub!(:new).with({'these' => 'params'}).and_return(mock_idea(:save => false))
        post :create, :idea => {:these => 'params'}
        assigns[:idea].should equal(mock_idea)
      end

      it "re-renders the 'new' template" do
        Idea.stub!(:new).and_return(mock_idea(:save => false))
        post :create, :idea => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested idea" do
        Idea.should_receive(:find).with("37").and_return(mock_idea)
        mock_idea.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :idea => {:these => 'params'}
      end

      it "assigns the requested idea as @idea" do
        Idea.stub!(:find).and_return(mock_idea(:update_attributes => true))
        put :update, :id => "1"
        assigns[:idea].should equal(mock_idea)
      end

      it "redirects to the idea" do
        Idea.stub!(:find).and_return(mock_idea(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(idea_url(mock_idea))
      end
    end

    describe "with invalid params" do
      it "updates the requested idea" do
        Idea.should_receive(:find).with("37").and_return(mock_idea)
        mock_idea.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :idea => {:these => 'params'}
      end

      it "assigns the idea as @idea" do
        Idea.stub!(:find).and_return(mock_idea(:update_attributes => false))
        put :update, :id => "1"
        assigns[:idea].should equal(mock_idea)
      end

      it "re-renders the 'edit' template" do
        Idea.stub!(:find).and_return(mock_idea(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested idea" do
      Idea.should_receive(:find).with("37").and_return(mock_idea)
      mock_idea.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ideas list" do
      Idea.stub!(:find).and_return(mock_idea(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ideas_url)
    end
  end

end
