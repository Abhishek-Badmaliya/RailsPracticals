class NewuserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @newuser = params[:newuser]
    @url  = 'http://example.com/login'
    mail(to: @newuser.email, subject: 'Welcome to My Awesome Site')
  end
  
end
