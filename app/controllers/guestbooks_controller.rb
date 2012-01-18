class GuestbooksController < ApplicationController
  
  def index
    @guestbooks = Guestbook.all
  end
  
end
