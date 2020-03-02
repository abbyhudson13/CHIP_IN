class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :address
      t.text :description
      t.date :starts_at
      t.date :ends_at
      t.integer :capacity
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
