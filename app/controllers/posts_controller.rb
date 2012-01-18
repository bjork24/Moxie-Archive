class PostsController < ApplicationController
  
  def index
    @posts = params[:year] && params[:month] ?
      Post.posts_by_month(params[:year], params[:month]) :
      Post.all
    @years = Post.years
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
