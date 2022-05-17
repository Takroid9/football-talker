class Public::RecommendsController < ApplicationController

  def create
    Recommend.create(talker_id: current_talker.id, player_id: params[:player_id])
    redirect_to player_path(params[:player_id])
  end
  
  def destroy
    recommend = Recommend.find_by(talker_id: current_talker.id, player_id: params[:id])
    recommend.destroy
    redirect_to player_path(params[:player_id])
  end
    
end
