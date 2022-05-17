class Admin::LeaguesController < ApplicationController
  def new
    @league = League.new
  end
  
  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to admin_leagues_path
    else
      render :index
    end
  end
  
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @team = Team.where(league: @league.id)
    @teams = @team.order("short_name")
  end

  def edit
    @league = League.find(params[:id])
  end
  
  def update
    @league = League.find(params[:id])
    @league.update(league_params)
    redirect_to admin_leagues_path
  end
  
  private
  
  def league_params
    params.require(:league).permit(:name, :country, :division)
  end
end
