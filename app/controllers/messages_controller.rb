class MessagesController < ApplicationController

# Creates new message instance
  def new
    @message = Message.new
  end

# Defines what new message is and if the user is a teacher or student
  def create
    @message = Message.new(message_params)
    # If user is a teacher, redirects to teacher page
      if @message.save && current_user
        flash[:notice] = " Message added successfully! "
        redirect_to '/pages/tmessages'
      # If user is a student, redirects to student page
      elsif @message.save && current_student_user
        # Defines cost of item
        cost = @message.cost
        # Defines ID of item
        productparam = @message.productid
        productid = Product.find(productparam)
        # Increments the student's week to 1 so that they are unable to buy anything else that week
        current_student_user.increment!(:week, 1)
        # Deducts the cost of the item from the student's point total
        current_student_user.decrement!(:points, cost)
        # Decreases the quantity of the item by 1
        productid.decrement!(:quantity, 1)
        flash[:notice] = " Item bought successfully! "
        redirect_to '/pages/store'
      else
        flash[:notice] = "Something went wrong!"
      end
  end

# Deletes a message
  def destroy
    Message.find(params[:id]).destroy
    #  If the user is a student, redirect to student page
      if current_student_user
      flash[:delete] = " Message deleted successfully! "
      redirect_to '/pages/smessages'
    # If the user is a teacher, redirect to teacher page
    elsif current_user
      flash[:delete] = " Message deleted successfully! "
      redirect_to '/pages/alerts'
    end
  end

  private

  # Defines params needed for message to be set up, also allows user_id, cost, product to come through from hidden field
  def message_params
    params.require(:message).permit(:user_id, :content, :cost, :productid)
  end

end
