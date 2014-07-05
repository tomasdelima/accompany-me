class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def new
    @activity = Activity.new
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
    @activity.destroy

    redirect_to user_path
  end



  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def assign_activity_attributes
    pa = params[:activity]

    if pa["last_occurrence(1i)"].present? && pa["last_occurrence(2i)"].present? && pa["last_occurrence(3i)"].present?
      last_occurrence = DateTime.new(
        pa["last_occurrence(1i)"].to_i,
        pa["last_occurrence(2i)"].to_i,
        pa["last_occurrence(3i)"].to_i,
        pa["last_occurrence(4i)"].to_i,
        pa["last_occurrence(5i)"].to_i
      )
    end

    @activity.assign_attributes(
      name:                    pa[:name],
      frequency:               pa[:frequency],
      last_occurrence:         last_occurrence,
      accompaniment_frequency: pa[:accompaniment_frequency].to_i,
      organizer:               @organizer
    )
  end

  def set_participants
    @activity.participant_ids = params[:activity][:participant_ids]
  end
end
