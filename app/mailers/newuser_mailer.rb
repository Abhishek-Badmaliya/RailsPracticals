class NewuserMailer < ApplicationMailer
  default from: 'notifications@spacex.com'

  #define method for new user's creation
  def welcome_email
    @newuser = params[:newuser]
    mail(to: @newuser.email, subject: 'Welcome to My Awesome Site')
  end
  
  #define method for updation of email
  def update_email
    @newuser = params[:newuser]
    mail(to: @newuser.email, subject: 'Your email has been updated !')
  end
end
