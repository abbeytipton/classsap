class AddMessageToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :message, :string
  end
end
