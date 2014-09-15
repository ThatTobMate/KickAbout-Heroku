class TeamMatch < ActiveRecord::Base
  attr_accessible :team_a_id, :team_b_id, :status, :title, :location
  belongs_to :team_a, :class_name => :Team
  belongs_to :team_b, :class_name => :Team

end
