class TeamsController < ApplicationController

  before_filter :authenticate!, only: [:new, :create, :show]
  before_filter :forward_if_has_team, only: [:new]

  def index
    @teams = Team.all
  end

  def create
    # Hoa
    @team = Team.create(params[:team])
    @user = current_user
   
    if @team.save
         @user.update_attributes(:team_id => @team.id)
         flash[:notice] = "Successfully created Team."
         redirect_to team_path(@team)
    else
        @teams = Team.all
         flash[:alert] = "There was an error in creating your team."
         render :action => 'new'
       end
   
  end

  def new
    # redirect_to root_path if current_user.nil?
    # Hoa
    @teams = Team.all
    @team = Team.new
    
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
    def forward_if_has_team
       redirect_to team_path(current_user.team) and return if current_user && current_user.team
    end    
    def team_params
      params[:team].slice :name, :password, :heroku, :bit_bucket
    end

end
