class PagesController < ApplicationController
  def home
	@title = "Welcome"
    if signed_in?
	  @micropost = Micropost.new 
	  @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
	@title = "About"
  end
  def help
	@title = "Support"
  end

end
