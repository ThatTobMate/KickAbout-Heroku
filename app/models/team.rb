class Team < ActiveRecord::Base
  attr_accessible :name, :league_id, :crest, :location, :wins, :losses, :points, :draws
  mount_uploader :crest, ImageUploader
  belongs_to :league
  has_many :users 
  has_many(:team_matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_matches, :class_name => :TeamMatch,
      :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :team_matches, :source => :team_b
end
