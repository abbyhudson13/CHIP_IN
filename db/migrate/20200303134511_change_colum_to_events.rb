class ChangeColumToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :starts_at, :datetime
    change_column :events, :ends_at, :datetime
  end
end
