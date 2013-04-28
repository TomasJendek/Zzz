# -*- encoding : utf-8 -*-
class CreateAmbulances < ActiveRecord::Migration
  def change
    create_table :ambulances do |t|
      t.string :specialization
      t.references :region
      t.integer :region_id
      t.string :link


      t.timestamps
    end
    add_index :ambulances, :region_id
  end
end
