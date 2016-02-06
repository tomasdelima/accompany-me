class AccompanimentsController < ApplicationController
  before_action :set_learnings, only: [:show, :update]

  def new
    if params[:friend_id]
      @friend = Friend.find(params[:friend_id])
      @redirect_to = friend_path(params[:friend_id])
    end
    if params[:activity_id]
      @activity = Activity.find(params[:activity_id])
      @redirect_to = activity_path(params[:activity_id])
    end

    @accompaniment = Accompaniment.new
  end

  def create
    @accompaniment = Accompaniment.new(accompaniment_params)

    if @accompaniment.save
      redirect_to params[:accompaniment][:redirect_to]
    else
      params[:errors] = @accompaniment.errors.messages
      if params[:accompaniment][:redirect_to].include? 'friend'
        @friend = Friend.find(params[:accompaniment][:friend_id])
      elsif params[:accompaniment][:redirect_to].include? 'activity'
        @activity = Activity.find(params[:accompaniment][:activity_id])
      end

      render :new
    end
  end

  def show
    @model_name = 'Accompaniment'
    @accompaniment = Accompaniment.find(params[:id])
  end

  def edit
    @accompaniment = Accompaniment.find(params[:id])
# debugger
    @friend = @accompaniment.friend
    @activity = @accompaniment.activity
  end

  private

    def accompaniment_params
      params.require(:accompaniment).permit(:subject, :activity_id, :friend_id, :plans, :achievements, :observations, :place, :date_time)
    end

    def set_learnings
      @learnings = current_user.learnings.where(related_to_id: params[:id], related_to_type: 'Accompaniment')
    end
end
