class PagesController < ApplicationController

# Requires teacher users to be logged in to see these pages
before_action :require_user, only: [:alerts, :epoints, :estore, :estudents, :maintenance, :points, :tlanding, :support, :tmessages]

# Redirects if a teacher user is logged in and tries to access these pages
before_action :logged_in, only: [:tlogin, :index]

# Requires student users to be logged in to see these pages
before_action :require_student_user, only: [:slanding, :help, :smessages, :spoints, :store]

# Redirects if a student user is logged in and tries to access these pages
before_action :logged_in_student, only: [:slogin, :index]

end
