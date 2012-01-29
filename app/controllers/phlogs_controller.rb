class PhlogsController < ApplicationController

  def index
    @phlogs = Phlog.all
  end
  
  def show
    @phlog = Phlog.find_by_o_id(params[:id]) || not_found
  end
  
end
