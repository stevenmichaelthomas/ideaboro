class UsersController < ApplicationController
before_filter :authenticate, :only => [:show]
before_filter :correct_user, :only => [:show]
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
  @user = User.new(params[:user])
   if @user.save #if this is possible, do it
	UserMailer.welcome_email(@user).deliver
	sign_in @user
    flash[:success] = "Welcome to Ideaborough."
	redirect_to root_path
   else
   @title = "Sign up"
   @user.password = ""
   @user.password_confirmation = ""
   render 'new'
   end
 end
   
   def edit
	 @user = User.find(params[:id])
	 @title = "Edit user"
   end
   
   def update
	  @user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	  flash[:success] = "Profile updated."
	  redirect_to @user
	else
	  @title ="Edit user"
	  render 'edit'
	end
end

	def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  private
  def authenticate
    deny_access unless signed_in?
  end
def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
end
end