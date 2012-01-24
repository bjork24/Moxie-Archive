class CategoriesController < ApplicationController
  
  def show
    @category = Category.find_by_id(params[:id]) || not_found
    @posts = @category.posts
    @years = @posts.years
  end
  
end
