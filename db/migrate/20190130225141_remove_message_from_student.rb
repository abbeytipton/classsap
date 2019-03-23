class RemoveMessageFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :message, :string
  end
end
