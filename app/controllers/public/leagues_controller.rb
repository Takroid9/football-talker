class Public::LeaguesController < ApplicationController
  
  def index
    @leagues = League.order("country","division")
  end

  def show
    @league = League.find(params[:id])
    @team = Team.where(league: @league.id)
    @teams = @team.order("short_name")
  end

end
