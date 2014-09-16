class StaticController < ApplicationController
  before_filter :authenticate_user!
  def index

    gon.user = current_user
    gon.team = current_user.team
    if current_user.team
      gon.team_members = current_user.team.users
      gon.team_id = current_user.team.id
      gon.match_details = current_user.team.team_matches
      gon.match = current_user.team.team_matches.map do |match|
        m = {}
        m["title"] = match.title
        m["location"] = match.location
        m["team_a"] = match.team_a
        m["team_b"] = match.team_b
        m["id"] = match.id
        m["status"] = match.status
        m["time"] = match.time.strftime("%I:%M %p")
        m["date"] = match.date
        m["team_a_score"] = match.team_a_score
        m["team_b_score"] = match.team_b_score
        m
      end

      gon.challenges = TeamMatch.where(team_b_id: current_user.team.id).map do |match|
        m = {}
        m["title"] = match.title
        m["location"] = match.location
        m["team_a"] = match.team_a
        m["team_b"] = match.team_b
        m["id"] = match.id
        m["status"] = match.status
        m["time"] = match.time.strftime("%I:%M %p")
        m["date"] = match.date
        m["team_a_score"] = match.team_a_score
        m["team_b_score"] = match.team_b_score
        m
      end

    # respond_to do |format|
    #   format.html { gon }
    #   format.json { render json: gon.challenges }
    # end

    respond_to do |format|
      format.html { gon }
      format.json { render json: { match: gon.match, challenges: gon.challenges}}
    end
  

  end

      #   if current_user.team
      # gon.points = (current_user.team.wins * 3) + (current_user.team.draws * 1)
    if current_user.team
        gon.user_league = current_user.team.league
    end
     gon.leagues = League.all.as_json(:include => [:teams])
  end


end
