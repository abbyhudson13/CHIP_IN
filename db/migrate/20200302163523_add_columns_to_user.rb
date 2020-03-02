class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :address, :text
    add_column :users, :role, :string
  end
end
