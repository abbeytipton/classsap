

namespace :studenttask do
task :resetweek => :environment do
  student = Student.all
  student.update_all(week: 0)
end
end
