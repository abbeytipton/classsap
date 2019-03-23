class RemoveTeacheridFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :teacherid, :integer
  end
end
