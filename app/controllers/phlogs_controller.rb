class PhlogsController < ApplicationController

  def index
    @phlogs = Phlog.all
    @title = "Phlogs"
  end
  
  def show
    @phlog = Phlog.find_by_o_id(params[:id]) || not_found
    @title = "Phlogs | #{@phlog.title}"
  end
  
end
