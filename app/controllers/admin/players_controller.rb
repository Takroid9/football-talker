class Admin::PlayersController < ApplicationController
  before_action :authenticate_admin!
  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admin_players_path
    else
      render :index
    end
  end

  def index

    @players = Player.order(:birthday)
  end

  def show
    @player = Player.find(params[:id])

    today = Date.today.strftime("%Y%m%d").to_i
    birthday = Player.find(@player.id).birthday
    @age = (today - birthday) / 10000
    @year = birthday / 10000
    @month = birthday % 10000 / 100
    @day = birthday % 100
  end

  def edit
    @player = Player.find(params[:id])
    @teams = Team.all
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to admin_players_path
  end

  private

  def player_params
    params.require(:player).permit(:team_id, :number, :position, :name, :lead_name, :country, :foot, :height, :weight, :is_active, :birthday)
  end
end
