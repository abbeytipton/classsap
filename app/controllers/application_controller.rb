class ApplicationController < ActionController::Base

# Protection from hackers
protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

# Helper methods
helper_method [:current_user]
helper_method [:current_student_user]
helper_method [:teacher_students]
helper_method [:students]
helper_method [:messages]
helper_method [:student_messages]

  # Defines what a current teacher user is, if one is logged in
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  # Defines what a current user's students' are
    def teacher_students
      @teacher_students ||= Student.where(teacher_id: current_user)
    end

  # Defines a single student to use in update form to give certain students points
    def students
      @students = Student.all.first
    end

  # Defines a single message for the user to show alert badge if they have a message upon login
    def messages
      @messages ||= Message.where(user_id: current_user).first
    end

  # Defines a single message for the student to show alert badge if they have a message upon logged_in
  def student_messages
    @student_messages ||= Message.where(user_id: current_student_user).first
  end

  # Defines what a current student user is, if one is logged in
    def current_student_user
      @current_student_user ||= Student.find(session[:student_user_id]) if session[:student_user_id]
    end

  # Method to require teacher users to be logged in before accessing certain pages, redirects to their login pages and flashes error messages if they are not logged in
    def require_user
      redirect_to '/pages/tlogin' unless current_user
      flash[:danger] = ['Please log in first.']
    end

  # Redirects teacher users to their landing page if they are logged in and try to access certain pages
    def logged_in
      redirect_to '/pages/tlanding' unless !current_user
    end

    # Method to require student users to be logged in before accessing certain pages, redirects to their login pages and flashes error messages if they are not logged in
    def require_student_user
      redirect_to '/pages/slogin' unless current_student_user
      flash[:danger] = ['Please log in first.']
    end

    # Redirects student users to their landing page if they are logged in and try to access certain pages
    def logged_in_student
      redirect_to '/pages/slanding' unless !current_student_user
    end


end
