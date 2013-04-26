class Ambulance < ActiveRecord::Base
  belongs_to :region
  attr_accessible :specialization
end
