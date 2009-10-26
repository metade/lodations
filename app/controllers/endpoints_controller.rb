class EndpointsController < ApplicationController
  # GET /endpoints
  # GET /endpoints.xml
  def index
    @endpoints = Endpoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @endpoints }
    end
  end

  # GET /endpoints/1
  # GET /endpoints/1.xml
  def show
    @endpoint = Endpoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @endpoint }
    end
  end

  # GET /endpoints/new
  # GET /endpoints/new.xml
  def new
    @endpoint = Endpoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @endpoint }
    end
  end

  # GET /endpoints/1/edit
  def edit
    @endpoint = Endpoint.find(params[:id])
  end

  # POST /endpoints
  # POST /endpoints.xml
  def create
    @endpoint = Endpoint.new(params[:endpoint])

    respond_to do |format|
      if @endpoint.save
        flash[:notice] = 'Endpoint was successfully created.'
        format.html { redirect_to(@endpoint) }
        format.xml  { render :xml => @endpoint, :status => :created, :location => @endpoint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @endpoint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /endpoints/1
  # PUT /endpoints/1.xml
  def update
    @endpoint = Endpoint.find(params[:id])

    respond_to do |format|
      if @endpoint.update_attributes(params[:endpoint])
        flash[:notice] = 'Endpoint was successfully updated.'
        format.html { redirect_to(@endpoint) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @endpoint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /endpoints/1
  # DELETE /endpoints/1.xml
  def destroy
    @endpoint = Endpoint.find(params[:id])
    @endpoint.destroy

    respond_to do |format|
      format.html { redirect_to(endpoints_url) }
      format.xml  { head :ok }
    end
  end
end
