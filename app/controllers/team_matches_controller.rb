class TeamMatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    puts "I am in the create action"
    @team_match = TeamMatch.new
    params1 = params[:team_match]
    params2 = params1[:team_match_data]
    @team_match.team_a_id = params1[:team_a_id]
    @team_match.team_b_id = params1[:team_b_id]
    @team_match.title = params2[:title]
    @team_match.location = params2[:location]

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

  def destroy
    @team_match = TeamMatch.find(params[:id])
    @team_match.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
