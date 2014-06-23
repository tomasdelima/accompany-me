class AccompanimentsController < ApplicationController

  def new
    @friend = Friend.find(params[:friend_id]) if params[:friend_id]
    @activity = Activity.find(params[:activity_id]) if params[:activity_id]

    @accompaniment = Accompaniment.new
  end

  def create
    @accompaniment = Accompaniment.new(accompaniment_params)
    @accompaniment.save

    redirect_to root_path
  end



  private

  def accompaniment_params
    params.require(:accompaniment).permit(:subject, :activity_id, :friend_id, :plans, :achievements, :observations, :place)
  end
end
