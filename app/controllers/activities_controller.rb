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
      pa = params[:activity]

      @activity.assign_attributes(
        name:                    pa[:name],
        frequency:               pa[:frequency],
        last_occurrence:         parse_date("last_occurrence"),
        last_accompanied:        parse_date("last_accompanied"),
        accompaniment_frequency: pa[:accompaniment_frequency],
        organizer:               @organizer
      )
    end

    def parse_date date_name
      pa = params[:activity]

      if pa["#{date_name}(1i)"].present? && pa["#{date_name}(2i)"].present? && pa["#{date_name}(3i)"].present?
        DateTime.new(
          pa["#{date_name}(1i)"].to_i,
          pa["#{date_name}(2i)"].to_i,
          pa["#{date_name}(3i)"].to_i,
          pa["#{date_name}(4i)"].to_i,
          pa["#{date_name}(5i)"].to_i
        )
      end
    end

    def set_participants
      @activity.participant_ids = params[:participant_ids] || params[:activity][:participant_ids] rescue nil
    end
end
