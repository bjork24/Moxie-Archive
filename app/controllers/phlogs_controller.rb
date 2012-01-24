class PhlogsController < ApplicationController

  def index
    @phlogs = Phlog.all
  end
  
  def show
    @phlog = Phlog.find_by_o_id(params[:id]) || not_found
  end
  
  def edit
    @phlog = Phlog.find_by_o_id(params[:id])
  end

  def update
    @phlog = Phlog.find_by_o_id(params[:id])
    respond_to do |format|
      if @phlog.update_attributes(params[:phlog])
        format.html { redirect_to(@phlog, :notice => 'Phlog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phlog.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
