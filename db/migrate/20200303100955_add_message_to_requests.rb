class AddMessageToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :message, :text
  end
end
