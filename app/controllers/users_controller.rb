class UsersController < ApplicationController

# Creates a new user and directs them to the landing page, flashes success message if account is created
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # Sends welcome email to user's email address
      #UserMailer.welcome_email(@user).deliver_now
      redirect_to '/pages/tlanding'
      flash[:notice] = " Welcome to Class Sap! Your account has been successfully created. "
    else
  # Flashes the error message and reloads the page to create a new account
      flash[:register_errors] = @user.errors.full_messages
      redirect_to '/pages/newaccount'
    end

  end

  # Edits a user
  def edit
   @user = User.find(params[:id])
  end

  # Updates a user based on user input
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to '/pages/profile'
      flash[:notice] = " Your profile has been updated successfully. "
    elsif
      flash[:error] = @user.errors.full_messages
      redirect_to '/pages/profile'
    end
  end

  private

# Requires the following items to be entered before the user can be created
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
