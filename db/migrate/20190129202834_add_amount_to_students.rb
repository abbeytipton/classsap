class AddAmountToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :amount, :integer
  end
end
