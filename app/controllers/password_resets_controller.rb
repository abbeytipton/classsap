class PasswordResetsController < ApplicationController

  def new
  end

  # Creates new instance of email with token
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:notice] = ' E-mail sent with password reset instructions. '
    redirect_to '/pages/tlogin'
  end

  # Lets user edit password
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  # Updates user password based on input
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hour.ago
      flash[:notice] = ' Password reset has expired '
      redirect_to '/pages/tlogin'
    elsif @user.update(user_params)
      flash[:notice] = ' Password has been reset! '
      redirect_to '/pages/tlogin'
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:password)
  end

end
