class PhlogsController < ApplicationController
  # GET /phlogs
  # GET /phlogs.xml
  def index
    @phlogs = Phlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phlogs }
    end
  end

  # GET /phlogs/1
  # GET /phlogs/1.xml
  def show
    @phlog = Phlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phlog }
    end
  end

  # GET /phlogs/new
  # GET /phlogs/new.xml
  def new
    @phlog = Phlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phlog }
    end
  end

  # GET /phlogs/1/edit
  def edit
    @phlog = Phlog.find(params[:id])
  end

  # POST /phlogs
  # POST /phlogs.xml
  def create
    @phlog = Phlog.new(params[:phlog])

    respond_to do |format|
      if @phlog.save
        format.html { redirect_to(@phlog, :notice => 'Phlog was successfully created.') }
        format.xml  { render :xml => @phlog, :status => :created, :location => @phlog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phlogs/1
  # PUT /phlogs/1.xml
  def update
    @phlog = Phlog.find(params[:id])

    respond_to do |format|
      if @phlog.update_attributes(params[:phlog])
        format.html { redirect_to(@phlog, :notice => 'Phlog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phlog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phlogs/1
  # DELETE /phlogs/1.xml
  def destroy
    @phlog = Phlog.find(params[:id])
    @phlog.destroy

    respond_to do |format|
      format.html { redirect_to(phlogs_url) }
      format.xml  { head :ok }
    end
  end
end
