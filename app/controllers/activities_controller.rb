class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @organizer = @activity.organizer
  end
end
