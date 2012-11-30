class TeamsController < ApplicationController

  before_filter :authenticate!, only: [:new, :create, :show, :join]
  before_filter :forward_if_has_team, only: [:new]
  before_filter :authenticate_current_user!, only: [:show, :update]

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
    @team = Team.find(params[:team][:id])

    if @team.password != params[:team][:password]
      flash[:error] = "Incorrect password"
      redirect_to new_team_path and return
    end

    if @team.users.size >= 4
      flash[:error] = "The team you selected is full."
      redirect_to new_team_path and return
    end

    @team.users << current_user

    redirect_to team_path(@team)
  end

  def leave
    current_user.team = nil
    current_user.save
    redirect_to new_team_path
  end

  def show
    @team = Team.find(params[:id])
    @user = current_user

    # Landon
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    @team.save!
    redirect_to team_path(@team)
  end

  def mailer
    email = params[:email]
    if TeamMailer.send_invite(email, current_user)
      flash[:success] = "Invite has been sent"
      redirect_to :back
    else
      flash[:failure] = "An error occured"
      redirect_to :back
    end
  end

  private
    def forward_if_has_team
       redirect_to team_path(current_user.team) and return if current_user && current_user.team
    end    
    def team_params
      params[:team].slice :name, :password, :heroku, :bit_bucket
    end

    def authenticate_current_user!
      @team = Team.find(params[:id])
      redirect_to root_path and return unless @team.users.include?(current_user)
    end

end
