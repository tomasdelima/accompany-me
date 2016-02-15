class AccompanimentsController < ApplicationController
  before_action :set_learnings, only: [:show, :create, :update]
  before_action :find_accompaniment, only: [:show, :edit, :update, :destroy]

  def new
    @friend = Friend.find(params[:friend_id]) if params[:friend_id]
    @activity = Activity.find(params[:activity_id]) if params[:activity_id]

    @accompaniment = Accompaniment.new
  end

  def create
    @accompaniment = Accompaniment.new(accompaniment_params)

    if @accompaniment.save
      render :show
    else
      params[:errors] = @accompaniment.errors.messages
      @friend = Friend.find(params[:accompaniment][:friend_id]) if params[:accompaniment][:redirect_to].include? 'friend'
      @activity = Activity.find(params[:accompaniment][:activity_id]) if params[:accompaniment][:redirect_to].include? 'activity'

      render :new
    end
  end

  def show
    @model_name = 'Accompaniment'
  end

  def edit
    @friend = @accompaniment.friend
    @activity = @accompaniment.activity
  end

  def update
    if @accompaniment.save
      redirect_to accompaniment_path(@accompaniment)
    else
      params[:errors] = @accompaniment.errors.messages
      render :edit
    end
  end

  def destroy
    @accompaniment.delete
    redirect_to user_path
  end

  private

    def find_accompaniment
      @accompaniment = Accompaniment.find(params[:id])
    end

    def accompaniment_params
      params.require(:accompaniment).permit(:subject, :activity_id, :friend_id, :plans, :achievements, :observations, :place, :date_time)
    end

    def set_learnings
      @learnings = current_user.learnings.where(related_to_id: params[:id], related_to_type: 'Accompaniment')
    end
end
