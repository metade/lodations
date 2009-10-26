class CannedQueriesController < ApplicationController
  before_filter :load_idea
  
  # GET /queries
  # GET /queries.xml
  def index
    @queries = @idea.canned_queries

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @queries }
    end
  end

  # GET /queries/1
  # GET /queries/1.xml
  def show
    @query = CannedQuery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @query }
    end
  end

  # GET /queries/new
  # GET /queries/new.xml
  def new
    @query = CannedQuery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @query }
    end
  end

  # GET /queries/1/edit
  def edit
    @query = CannedQuery.find(params[:id])
  end

  # POST /queries
  # POST /queries.xml
  def create
    @query = CannedQuery.new(params[:canned_query])

    respond_to do |format|
      if @query.save
        flash[:notice] = 'Query was successfully created.'
        format.html { redirect_to(idea_canned_query_url(@idea, @query)) }
        format.xml  { render :xml => @query, :status => :created, :location => @query }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @query.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /queries/1
  # PUT /queries/1.xml
  def update
    @query = CannedQuery.find(params[:id])

    respond_to do |format|
      if @query.update_attributes(params[:canned_query])
        flash[:notice] = 'Query was successfully updated.'
        format.html { redirect_to(idea_canned_query_path(@idea, @query)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @query.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.xml
  def destroy
    @query = CannedQuery.find(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to(queries_url) }
      format.xml  { head :ok }
    end
  end
  
  protected 
  
  def load_idea
    @idea = Idea.find(params[:idea_id])
  end
end
