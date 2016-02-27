class ActivitiesController < ApplicationController
  before_action :init_activity, only: [:new, :create]
  before_action :find_activity, only: [:show, :edit, :update, :destroy]
  before_action :assign_activity_attributes, only: [:create, :update]

  def index
  end

  def new
    set_participants
  end

  def create
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
  end

  def edit
  end

  def update
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

    def init_activity
      @object = @activity = Activity.new(activity_params)
    end

    def find_activity
      @object = @activity = Activity.find(params[:id])
    end

    def assign_activity_attributes
      @activity.assign_attributes(activity_params)
    end

    def activity_params
      params[:activity] ||= {activitable_type: params[:activitable_type], activitable_id: params[:activitable_id]}
      params.require(:activity).permit!
    end

    def set_participants
      @activity.participant_ids = params[:participant_ids] || params[:activity][:participant_ids] rescue nil
    end
end
