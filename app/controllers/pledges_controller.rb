class PledgesController < ApplicationController
  def index
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
