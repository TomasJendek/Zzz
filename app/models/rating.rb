class Rating < ActiveRecord::Base
  belongs_to :ambulance_item
  attr_accessible :ambulance_item_id, :comment, :value

  validates :comment,  :presence => true, :length => {:minimum => 5}
  validates :value,  :presence => true
end
