# -*- encoding : utf-8 -*-
class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
