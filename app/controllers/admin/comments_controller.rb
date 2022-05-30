class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all.reverse_order()
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
