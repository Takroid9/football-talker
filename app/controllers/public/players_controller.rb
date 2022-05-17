class Public::PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @players = Player.all.page(params[:page]).order(:birthday)
  end
  
  def search
    if params[:keyword].present?
      @players = Player.search(params[:keyword]).order("birthday")
    elsif params[:recommend]
      @players = Player.joins(:recommends).group(:player_id).order('count(recommends.id) DESC')
    elsif params[:comment]
      @players = Player.joins(:comments).group(:player_id).order('count(player_id) DESC')
    end
  end 
  
  def show
    @player = Player.find(params[:id])
    
    today = Date.today.strftime("%Y%m%d").to_i
    birthday = Player.find(@player.id).birthday
    @age = (today - birthday) / 10000
    @year = birthday / 10000
    @month = birthday % 10000 / 100
    @day = birthday % 100
    
    @comment = Comment.new
    @comment_reply = Comment.new
  end
  
  
  
end
