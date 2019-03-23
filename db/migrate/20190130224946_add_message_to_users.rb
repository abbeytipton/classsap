class AddMessageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :message, :string
  end
end
