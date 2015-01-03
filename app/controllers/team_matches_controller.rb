class TeamMatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  def create
    puts "I am in the create action"
    @team_match = TeamMatch.new
    params1 = params[:team_match]
    params2 = params1[:team_match_data]
    params3 = params1[:status]
    @team_match.team_a_id = params1[:team_a_id]
    @team_match.team_b_id = params1[:team_b_id]
    @team_match.title = params2[:title]
    @team_match.location = params2[:location]
    @team_match.time = params2[:time]
    @team_match.date = params2[:date]
    @team_match.status = params3

    respond_to do |format|
      if @team_match.save
        format.html { redirect_to @team_match, notice: 'Match was successfully created.' }
        format.json { render json: @team_match, status: :created, location: @team_match }
      else
        format.html { render action: "new" }
        format.json { render json: @team_match.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @team_match = TeamMatch.find(params[:id])
  end

  def update
    @team_match = TeamMatch.find(params[:id])
    params1 = params[:team_match]
    params2 = params1[:status]
    @team_match.status = params2

    respond_to do |format|
      if @team_match.update_attributes(params[:team_match])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render json: @team }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_score
    @team_match = TeamMatch.find(params[:id])
    params1 = params[:team_match]
    @team_match.team_a_score = params1[:team_a_score]
    @team_match.team_b_score = params1[:team_b_score]
    if @team_match.team_a_score > @team_match.team_b_score
     @team_match.team_a.wins = @team_match.team_a.wins + 1
     @team_match.team_b.losses = @team_match.team_b.losses + 1
   elsif @team_match.team_a_score == @team_match.team_b_score
     @team_match.team_a.draws = @team_match.team_a.draws + 1
     @team_match.team_b.draws = @team_match.team_b.draws + 1
   elsif @team_match.team_a_score < @team_match.team_b_score
     @team_match.team_a.losses = @team_match.team_a.losses + 1
     @team_match.team_b.wins = @team_match.team_b.wins + 1
   end
   @team_match.save
   @team_match.team_a.points = (@team_match.team_a.wins * 3) + (@team_match.team_a.draws * 1)
   @team_match.team_b.points = (@team_match.team_b.wins * 3) + (@team_match.team_b.draws * 1)
   @team_match.team_a.save
   @team_match.team_b.save

   
   respond_to do |format|
    if @team_match.update_attributes(params[:team_match])
      format.html { redirect_to @team, notice: 'Team was successfully updated.' }
      format.json { render json: @team }
    else
      format.html { render action: "edit" }
      format.json { render json: @team.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @team_match = TeamMatch.find(params[:id])
  @team_match.destroy

  respond_to do |format|
    format.html { redirect_to teams_url }
    format.json { head :no_content }
  end
end
end
