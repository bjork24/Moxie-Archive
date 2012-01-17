class PhlogCommentsController < ApplicationController
  # GET /phlog_comments
  # GET /phlog_comments.xml
  def index
    @phlog_comments = PhlogComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phlog_comments }
    end
  end

  # GET /phlog_comments/1
  # GET /phlog_comments/1.xml
  def show
    @phlog_comment = PhlogComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phlog_comment }
    end
  end

  # GET /phlog_comments/new
  # GET /phlog_comments/new.xml
  def new
    @phlog_comment = PhlogComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phlog_comment }
    end
  end

  # GET /phlog_comments/1/edit
  def edit
    @phlog_comment = PhlogComment.find(params[:id])
  end

  # POST /phlog_comments
  # POST /phlog_comments.xml
  def create
    @phlog_comment = PhlogComment.new(params[:phlog_comment])

    respond_to do |format|
      if @phlog_comment.save
        format.html { redirect_to(@phlog_comment, :notice => 'Phlog comment was successfully created.') }
        format.xml  { render :xml => @phlog_comment, :status => :created, :location => @phlog_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phlog_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phlog_comments/1
  # PUT /phlog_comments/1.xml
  def update
    @phlog_comment = PhlogComment.find(params[:id])

    respond_to do |format|
      if @phlog_comment.update_attributes(params[:phlog_comment])
        format.html { redirect_to(@phlog_comment, :notice => 'Phlog comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phlog_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phlog_comments/1
  # DELETE /phlog_comments/1.xml
  def destroy
    @phlog_comment = PhlogComment.find(params[:id])
    @phlog_comment.destroy

    respond_to do |format|
      format.html { redirect_to(phlog_comments_url) }
      format.xml  { head :ok }
    end
  end
end
