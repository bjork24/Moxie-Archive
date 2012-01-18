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
  
end
