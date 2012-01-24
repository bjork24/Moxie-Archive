class PostsController < ApplicationController
  
  def index
    if params[:year]
      @posts = Post.posts_by_year(params[:year])
    else
      @posts = Post.all
    end
    @years = Post.years
    @current_year = params[:year] || @years.first;
    @current_month = params[:month] || nil
  end

  def show
    @post = Post.find_by_o_id(params[:id]) || not_found
    @years = Post.years
    @current_year = @post.created_at.year;
    @current_month = @post.created_at.month;
  end
  
  def edit
    @post = Post.find_by_o_id(params[:id])
  end

  def update
    @post = Post.find_by_o_id(params[:id])
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
