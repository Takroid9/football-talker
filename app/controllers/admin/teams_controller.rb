class Admin::TeamsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @team = Team.new
    @leagues = League.all
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path
    else
      render :index
    end
  end

  def index
    @teams = Team.order("short_name")
  end

  def show
    @team = Team.find(params[:id])
    @player = Player.where(team: @team.id)
    @players = @player.order("number")
  end

  def edit
    @team = Team.find(params[:id])
    @leagues = League.all
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to admin_team_path(@team.id)
  end


    private

  def team_params
    params.require(:team).permit(:name, :short_name, :league_id, :stadium, :coach)
  end
end
