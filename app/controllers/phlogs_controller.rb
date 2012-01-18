class PhlogsController < ApplicationController

  def index
    @phlogs = Phlog.all
  end
  
  def show
    @phlog = Phlog.find(params[:id])
  end
  
end
