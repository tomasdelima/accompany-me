class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_learnings, only: [:show, :update]

  def index
  end

  def new
    @activity = Activity.new(organizer_id: params[:organizer_id])
    set_participants
  end

  def create
    @organizer = Friend.find(params[:activity][:organizer_id]) if params[:activity][:organizer_id]
    @activity = Activity.new(user: current_user)
    assign_activity_attributes

    if @activity.valid?
      set_participants
      @activity.save

      redirect_to activity_path(@activity)
    else
      params[:errors] = @activity.errors.messages
      render :edit
    end
  end

  def show
    @model_name = 'Activity'
    @organizer = @activity.organizer
  end

  def edit
  end

  def update
    @organizer = Friend.find(params[:activity][:organizer_id])
    assign_activity_attributes

    if @activity.valid?
      set_participants
      @activity.save

      redirect_to activity_path(@activity)
    else
      params[:errors] = @activity.errors.messages
      render :edit
    end
  end

  def destroy
    @activity.delete
    redirect_to user_path
  end

  private

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def set_learnings
      @learnings = current_user.learnings.where(related_to_id: params[:id], related_to_type: 'Activity')
    end

    def assign_activity_attributes
      params.require(:activity).permit!
      @activity.assign_attributes(params[:activity])
    end

    def set_participants
      @activity.participant_ids = params[:participant_ids] || params[:activity][:participant_ids] rescue nil
    end
end
