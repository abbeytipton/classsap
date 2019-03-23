class AddCostToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :cost, :integer
  end
end
