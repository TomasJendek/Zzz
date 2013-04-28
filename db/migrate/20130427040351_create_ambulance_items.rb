# -*- encoding : utf-8 -*-

class CreateAmbulanceItems < ActiveRecord::Migration
  def change
    create_table :ambulance_items do |t|
      t.integer :ambulance_id
      t.string :name
      t.string :address
      t.text :link
      t.references :ambulance
      t.references :rating
      t.string :doctor

      t.timestamps
    end
    add_index :ambulance_items, :ambulance_id
  end
end
