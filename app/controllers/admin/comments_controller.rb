class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all.reverse_order()
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
