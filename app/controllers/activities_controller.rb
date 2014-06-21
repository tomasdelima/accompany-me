class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update]
  def show
    @organizer = @activity.organizer
  end

  def new
    @activity = Activity.new
  end

  def create
    @organizer = Friend.find(params[:activity][:organizer_id])
    @activity = Activity.new
    update_activity_attributes

    params[:activity][:friends][:friend_id].each do |friend_id|
      @activity.participants << Friend.find(friend_id) if friend_id.present?
    end

    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @organizer = Friend.find(params[:activity][:organizer_id])
    update_activity_attributes

    @activity.participants = []
    params[:activity][:friends][:friend_id].each do |friend_id|
      @activity.participants << Friend.find(friend_id) if friend_id.present?
    end

    redirect_to activity_path(@activity)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def update_activity_attributes
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

    @activity.update_attributes(
      name: pa[:name],
      frequency: pa[:frequency],
      last_occurrence: last_occurrence,
      organizer: @organizer
      )
  end
end
