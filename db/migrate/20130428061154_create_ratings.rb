class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :value
      t.references :ambulance_item
      t.integer :ambulance_item_id

      t.timestamps
    end
    add_index :ratings, :ambulance_item_id
  end
end
