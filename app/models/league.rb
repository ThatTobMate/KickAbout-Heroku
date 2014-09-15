class League < ActiveRecord::Base
  attr_accessible :location, :name
  has_many :teams
end
