class AddWeekToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :week, :integer
  end
end
