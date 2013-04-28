# -*- encoding : utf-8 -*-
class AmbulanceItem < ActiveRecord::Base
  belongs_to :ambulance
  has_many :ratings

  attr_accessible :address, :ambulance_id, :link, :name, :doctor, :rating_id
end
