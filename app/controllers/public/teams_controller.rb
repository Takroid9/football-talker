class Public::TeamsController < ApplicationController
 
  def index
    @teams = Team.order(:short_name)
  end

  def show
    @team = Team.find(params[:id])
    @player = Player.where(team: @team.id)
    @players = @player.order(:number)
  end
end
