class Public::FavoritesController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    comment = Comment.find(params[:comment_id])
    favorite = current_talker.favorites.new(comment_id: comment.id)
    favorite.save
    @item = comment
    @item.create_notification_by(current_talker)
    redirect_to player_path(@player)
    
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    favorite = current_talker.favorites.find_by(comment_id: comment.id)
    favorite.destroy
    redirect_to player_path(params[:player_id])
  end
end
