class AccompanimentsController < ApplicationController
  before_action :init_accompaniment, only: [:new, :create]
  before_action :find_accompaniment, only: [:show, :edit, :update, :destroy]
  before_action :assign_accompaniment_attributes, only: [:create, :update]

  def new
  end

  def create
    if @accompaniment.save
      render :show
    else
      params[:errors] = @accompaniment.errors.messages
      @activity = Activity.find(params[:accompaniment][:activity_id]) if params[:accompaniment][:redirect_to].include? 'activity'

      render :new
    end
  end

  def show
    @class_name = 'Accompaniment'
  end

  def edit
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

    def init_accompaniment
      @object = @accompaniment = Accompaniment.new(accompaniment_params)
    end

    def find_accompaniment
      @object = @accompaniment = Accompaniment.find(params[:id])
    end

    def assign_accompaniment_attributes
      @accompaniment.assign_attributes(accompaniment_params)
    end

    def accompaniment_params
      params[:accompaniment] ||= {accompaniable_type: params[:accompaniable_type], accompaniable_id: params[:accompaniable_id]}
      params.require(:accompaniment).permit(:accompaniable_type, :accompaniable_id, :subject, :activity_id, :plans, :achievements, :observations, :place, :date_time)
    end
end
