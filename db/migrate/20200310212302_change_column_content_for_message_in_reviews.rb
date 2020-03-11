class ChangeColumnContentForMessageInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :content, :message
  end
end
