ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "ideaborough.com",
  :user_name            => "steve@ideaborough.com",
  :password             => "rogers08",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
