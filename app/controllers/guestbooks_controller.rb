class GuestbooksController < ApplicationController
  
  def index
    @guestbooks = Guestbook.find(:all, :order => 'created_at')
    @title = "Guestbook"
  end
  
end
