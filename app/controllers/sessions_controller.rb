class SessionsController < ApplicationController

def new
end

# Looks up the teacher user and verifies their password is correct before letting them log in
  def create
      @user = User.find_by_email(params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/pages/tlanding'
      else
  # Flashes errors and redirects to the login page if the password is wrong or user doesn't exist
        flash[:login_errors] = [' Something went wrong. Try again! ']
        redirect_to '/pages/tlogin'
      end
  end

  # Looks up the user and verifies their password is correct before letting them log in
    def slogin
        @student = Student.find_by_username(slogin_params[:username].downcase)
        if @student && @student.authenticate(slogin_params[:password])
          session[:student_user_id] = @student.id
          redirect_to '/pages/slanding'
        else
  # Flashes errors and redirects to the login page if the password is wrong or user doesn't exist
          flash[:login_errors] = [' Something went wrong. Try again! ']
          redirect_to '/pages/slogin'
        end
    end

  # Logs a teacher user out and redirects them to the index
  def destroy
    session[:user_id] = nil
    redirect_to('/pages/index')
  end

  # Logs a student user out and redirects them to the index
    def destroy_student
      session[:student_user_id] = nil
      redirect_to('/pages/index')
    end

  private

  # Requires these items to login correctly for a teacher user
    def login_params
      params.require(:login).permit(:email, :password)
    end

  # Requires these items to login correctly for a teacher user
    def slogin_params
      params.require(:session).permit(:username, :password)
    end

end
