class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new]
  before_filter :correct_user, :except => [:new]
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
   if @user.save #if this is possible, do it
   sign_in @user
   flash[:success] = "Welcome to Ideaborough."
    redirect_to @user
   else
   @title = "Sign up"
   @user.password = ""
   @user.password_confirmation = ""
   render 'new'
   end
 end
   def edit
	 @title = "Edit user"
   end
   def update
	if @user.update_attribute(params[:user])
	  flash[:success] = "Profile updated."
	  redirect_to @user
	else
	  @title ="Edit user"
	  render 'edit'
	end
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