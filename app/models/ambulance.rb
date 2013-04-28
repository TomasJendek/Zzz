# -*- encoding : utf-8 -*-
class Ambulance < ActiveRecord::Base
  belongs_to :region

  has_many :ambulance_items

  attr_accessible :specialization, :region_id, :link

  self.per_page = 20
end
