class AuthorsController < ApplicationController
  
  def show
    @author = Author.find_by_id(params[:id]) || not_found
    @posts = @author.posts
    @years = @posts.years
    @title = "Posts by #{@author.name}"
  end
  
end
