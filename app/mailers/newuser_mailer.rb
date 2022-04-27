class NewuserMailer < ApplicationMailer
  default from: 'notifications@spacex.com'

  def welcome_email
    @newuser = params[:newuser]
    mail(to: @newuser.email, subject: 'Welcome to My Awesome Site')
  end
  
  def update_email
    @newuser = params[:newuser]
    mail(to: @newuser.email, subject: 'Your email has been updated !')
  end
end
