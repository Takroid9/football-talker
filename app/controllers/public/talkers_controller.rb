class Public::TalkersController < ApplicationController
  def show
    @talker = Talker.find(params[:id])
    @recommends = @talker.recommends
    time = Time.now.strftime('%H').to_i
    if time >= 4 && time <=9
      @greet = "おはようございます。 " + "#{@talker.name}" + "さん"
    elsif time >= 10 && time <= 17
      @greet = "こんにちは。 " + "#{@talker.name}" + "さん"
    else
      @greet = "こんばんは。 " + "#{@talker.name}" + "さん"
    end
  end
  
  def edit
    @talker = Talker.find(params[:id])
    if @talker != current_talker
      redirect_to talker_path(current_talker)
    end
  end
  
  def update
    @talker = Talker.find(params[:id])
    if @talker.update(talker_params)
      redirect_to talker_path(current_talker)
    else
      render :edit
    end
  end
  

  
  def talker_params
    params.require(:talker).permit(:name)
  end
end
