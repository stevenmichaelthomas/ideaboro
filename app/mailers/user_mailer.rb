class UserMailer < ActionMailer::Base
  default :from => "steve@ideaborough.com"
  
  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Ideaborough")
  end
end