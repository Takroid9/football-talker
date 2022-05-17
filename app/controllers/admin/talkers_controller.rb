class Admin::TalkersController < ApplicationController
  def index
    @talkers = Talker.all
  end

  def show
    @talker = Talker.find(params[:id])
    @recommends = @talker.recommends
  end
end
