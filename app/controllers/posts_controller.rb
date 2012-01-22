class PostsController < ApplicationController
  
  def index
    if params[:year] && params[:month]
      @posts = Post.posts_by_month(params[:year], params[:month])
    elsif params[:year] && !params[:month]
      @posts = Post.posts_by_year(params[:year])
    else
      @posts = Post.all
    end
    @years = Post.years
    @current_year = params[:year] || @years.first;
  end

  def show
    @post = Post.find(params[:id])
  end
  
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
