class PledgesController < ApplicationController
  def index
    redirect_to current_user.team if current_user && current_user.team
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.create(params[:pledge])

    if @pledge.save
      flash[:success] = "Thanks! We'll keep you posted."
      redirect_to root_path
    else
      render :index
    end
  end
end
