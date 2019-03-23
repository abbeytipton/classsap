class RemoveAmountFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :amount, :integer
  end
end
