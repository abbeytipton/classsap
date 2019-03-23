class ContactsController < ApplicationController

# This controller is for the contact form, I will get an email when a new message is created to let me know it's there

# Creates new contact instance
  def new
    @contact = Contact.new
  end

# Defines new contact and sends email
  def create
    @user = current_user
    @contact = Contact.new(contact_params)
      if @contact.save
        flash[:notice] = " Message added successfully! We will get back to you as soon as possible. "
        redirect_to '/pages/support'
        # Delivers contact email message to me
        UserMailer.contact_email(@user).deliver_now
      else
        flash[:notice] = " Something went wrong! "
      end
  end

  private

  # Defines params needed for contact to be set up, also allows user_id to come through from hidden field
  def contact_params
    params.require(:contact).permit(:body, :user_id)
  end

end
