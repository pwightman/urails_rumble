class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def create
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
end
