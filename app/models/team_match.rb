class TeamMatch < ActiveRecord::Base
  attr_accessible :team_a_id, :team_b_id, :status, :title, :location, :team_a_score, :team_b_score
  belongs_to :team_a, :class_name => :Team
  belongs_to :team_b, :class_name => :Team

end
