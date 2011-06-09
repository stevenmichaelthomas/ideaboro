class UserMailer < ActionMailer::Base
  default :from => "steve@ideaborough.com"
  
  def welcome_email(user)
   @user = User
   @url = signin_path
   mail(:to => User.email,
        :subject => "Welcome to Ideaborough")
  end
end
