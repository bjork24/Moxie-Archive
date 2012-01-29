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
  
end
