class MicropostsController < ApplicationController
 before_filter :authorized_user, :only => :destroy

  def create
  @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
    #  flash[:success] = "Idea stored!"
      redirect_to root_path
    else
      @feed_items = []
	  render 'pages/home'
    end
  end

def show
@user = current_user
@micropost = @user.microposts.find(params[:id]) 
end

def edit
 @micropost  = Micropost.find(params[:id])
end 
 
def destroy
 @micropost.destroy
 redirect_to root_path
 end
 
 private

    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
  
end