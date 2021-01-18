class StudentsController < ApplicationController

# Creates new student instance
  def new
    @student = Student.find(params[:id])
  end

# Defines what new student is and saves, then redirects to the edit students page, flashes success message if student is added
  def create
    @student = Student.new(student_params)
    if @student.save
        redirect_to '/pages/estudents'
        flash[:notice] = " Student added successfully! "
      else
        # Flashes the error message and reloads the page to edit students page with errors showing
        flash[:register_errors] = @student.errors.full_messages
        redirect_to '/pages/estudents'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

# Updates the point value using the text value of the submit button that is pressed
  def update
     @student = Student.find(params[:id])
     @students = @teacher_students
     case params[:commit]
       # When the button is save changes, all the params are updated via input from the user
     when 'Save Changes'
       @student.update_attributes(student_params)
         redirect_to '/pages/estudents'
         flash[:notice] = " Student information updated successfully. "
      # Otherwise points are updated instead

    # The first set is for all students
    when '+ 1 '
      @students.update_all('points = points + 1')
      redirect_to '/pages/points'
    when '+ 2 '
      @students.update_all('points = points + 2')
      redirect_to '/pages/points'
    when '+ 3 '
      @students.update_all('points = points + 3')
      redirect_to '/pages/points'
    when '+ 5 '
      @students.update_all('points = points + 5')
      redirect_to '/pages/points'
    when '+ 10 '
      @students.update_all('points = points + 10')
      redirect_to '/pages/points'
    when '+ 20 '
      @students.update_all('points = points + 20')
      redirect_to '/pages/points'
    when '+ 30 '
      @students.update_all('points = points + 30')
      redirect_to '/pages/points'
    when '+ 50 '
      @students.update_all('points = points + 50')
      redirect_to '/pages/points'
    when '- 1 '
      @students.update_all('points = points - 1')
      redirect_to '/pages/points'
    when '- 2 '
      @students.update_all('points = points - 2')
      redirect_to '/pages/points'
    when '- 3 '
      @students.update_all('points = points - 3')
      redirect_to '/pages/points'
    when '- 5 '
      @students.update_all('points = points - 5')
      redirect_to '/pages/points'
    when '- 10 '
      @students.update_all('points = points - 10')
      redirect_to '/pages/points'
    when '- 20 '
      @students.update_all('points = points - 20')
      redirect_to '/pages/points'
    when '- 30 '
      @students.update_all('points = points - 30')
      redirect_to '/pages/points'
    when '- 50 '
      @students.update_all('points = points - 50')
      redirect_to '/pages/points'
    when 'Delete All '
      @students.update_all('points = 0')
      redirect_to '/pages/points'


    # This set is for only the selected student
     when '+ 1'
       @student.increment!(:points, 1)
       redirect_to '/pages/points'
     when '+ 2'
       @student.increment!(:points, 2)
       redirect_to '/pages/points'
     when '+ 3'
       @student.increment!(:points, 3)
       redirect_to '/pages/points'
     when '+ 5'
       @student.increment!(:points, 5)
       redirect_to '/pages/points'
     when '+ 10'
       @student.increment!(:points, 10)
       redirect_to '/pages/points'
     when '+ 20'
       @student.increment!(:points, 20)
       redirect_to '/pages/points'
     when '+ 50'
       @student.increment!(:points, 50)
       redirect_to '/pages/points'
     when '- 1'
       @student.decrement!(:points, 1)
       redirect_to '/pages/points'
     when '- 2'
       @student.decrement!(:points, 2)
       redirect_to '/pages/points'
     when '- 3'
       @student.decrement!(:points, 3)
       redirect_to '/pages/points'
     when '- 5'
       @student.decrement!(:points, 5)
       redirect_to '/pages/points'
     when '- 10'
       @student.decrement!(:points, 10)
       redirect_to '/pages/points'
     when '- 20'
       @student.decrement!(:points, 20)
       redirect_to '/pages/points'
     when '- 50'
       @student.decrement!(:points, 50)
       redirect_to '/pages/points'
       # Deletes all points by resetting the column to 0
     when 'Delete All'
       @student.update_column(:points, 0)
       redirect_to '/pages/points'
     else
       @student.increment!(:points, 0)
     end
   end

   # This method runs every Sunday to reset all students' week param to 0 - this makes them able to buy items again
  def update_week
    Student.update_all(week: 0)
  end

# Deletes a student user
  def destroy
    Student.find(params[:id]).destroy
    flash[:delete] = " Student deleted successfully! "
    redirect_to '/pages/estudents'
  end

  private

  # Defines params needed for student to be set up, also allows teacher_id to come through from hidden field
  def student_params
    params.require(:student).permit(:name, :username, :password, :teacher_id, :points, :submit, :week)
  end

end
