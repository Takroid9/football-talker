class Public::CommentsController < ApplicationController
  def index
    @comments = current_talker.comments.reverse_order
  end 
  
  def show
    @comment = Comment.find(params[:id])
  end 
  
  def create
    player = Player.find(params[:player_id])
    comment = current_talker.comments.new(comment_params)
    comment.player_id = player.id
    @player = comment.player
    @comment_item = comment
      if comment.save
        player.create_notification_comment!(current_talker, @comment_item)
        redirect_to player_path(player)
      else
        redirect_to player_path(player)
      end
  end
  
  def edit
    @comment = Comment.find(params[:id])
    @player = @comment.player.id
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to player_path(@comment.player_id)
    else
      render :edit
    end
  end 
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to player_path(params[:player_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :player_id, :talker_id, :parent_id)
  end 
end
