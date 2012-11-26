class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
    @team = Team.create!(params[:team])

    redirect_to team_path(@team)
    # Hoa
  end

  def new
    redirect_to root_path if current_user.nil?
    # Hoa
  end

  def join
    @team = Team.find(params[:id])
    # Kingsley adds logic for adding member to team
    # Use 'current_user' as the logged-in user to assign
    # to this team.
    # Be sure to to error check things like:
    #  * There isn't more than 4 people on the team
  end

  def show
    @team = Team.find(params[:id])
    # Landon
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    @team.save!
    redirect_to team_path(@team)
  end

  private
    
    def team_params
      params[:team].slice :name, :password, :heroku, :bit_bucket
    end

end
