class PhlogsController < ApplicationController

  def index
    @phlogs = Phlog.all
  end
  
  def show
    @phlog = Phlog.find(params[:id])
  end
  
  def edit
    @phlog = Phlog.find(params[:id])
  end

  def update
    @phlog = Phlog.find(params[:id])
  end
  
end
