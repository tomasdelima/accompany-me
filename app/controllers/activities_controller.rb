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
    @activity = Activity.create(
      name: params[:activity][:name],
      organizer: @organizer
      )

    params[:activity][:friends][:friend_id].each do |friend_id|
      @activity.participants << Friend.find(friend_id) if friend_id.present?
    end

    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @organizer = Friend.find(params[:activity][:organizer_id])
    @activity.update_attributes(
      name: params[:activity][:name],
      organizer: @organizer
      )

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
end
