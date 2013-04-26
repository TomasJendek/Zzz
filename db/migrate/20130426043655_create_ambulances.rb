class CreateAmbulances < ActiveRecord::Migration
  def change
    create_table :ambulances do |t|
      t.string :specialization
      t.references :region

      t.timestamps
    end
    add_index :ambulances, :region_id
  end
end
