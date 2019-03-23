class UserMailer < ApplicationMailer

default from: 'classsapofficial@gmail.com'

  # Sends welcome email
    def welcome_email(user)
      @user = user
      @url  = 'www.classsap.com'
      mail(to: @user.email, subject: 'Welcome to Class Sap!')
    end

  # Sends contact email to me
    def contact_email(user)
      @user = user
      @url = 'www.classsap.com'
      mail(to: 'classsapofficial@gmail.com', subject: 'You have a message from a Class Sap user!')
    end

  # Sends forgot password email
    def forgot_password(user)
      @user = user
      @greeting = "Hello"
      mail to: user.email, :subject => 'Reset password instructions'
   end

end
