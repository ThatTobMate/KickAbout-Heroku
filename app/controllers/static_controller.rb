class StaticController < ApplicationController

  def index

    gon.user = current_user
    gon.team = current_user.team
    gon.team_members = current_user.team.users
  if current_user.team
    gon.team_id = current_user.team.id
    gon.match = current_user.team.team_matches.map do |match|
      m = {}
      m["title"] = match.title
      m["location"] = match.location
      m["team_a"] = match.team_a
      m["team_b"] = match.team_b
      m
    end
  end

    
    if current_user.team
        gon.user_league = current_user.team.league
    end
     gon.leagues = League.all.as_json(:include => [:teams])
  end


end
