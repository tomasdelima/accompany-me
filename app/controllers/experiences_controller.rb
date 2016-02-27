class ExperiencesController < ApplicationController
  before_action :init_experience, only: [:new, :create]
  before_action :find_experience, only: [:show, :edit, :update, :destroy]
  before_action :assign_experience_attributes, only: [:create, :update]

  def index
    @experiences = Experience.all
  end

  def new
  end

  def create
    if @experience.save
      redirect_to polymorphic_path(@experience.experienceable)
    else
      params[:errors] = @experience.errors.messages
      render :new
    end
  end

  def show
    @model_name = 'Experience'
  end

  def edit
  end

  def update
    if @experience.save
      redirect_to polymorphic_path(@experience.experienceable)
    else
      params[:errors] = @experience.errors.messages
      render :edit
    end
  end

  def destroy
    @experience.delete
    redirect_to user_path
  end

  private

    def init_experience
      @object = @experience = Experience.new(experience_params)
    end

    def find_experience
      @object = @experience = Experience.find(params[:id])
    end

    def assign_experience_attributes
      @experience.assign_attributes(experience_params)
    end

    def experience_params
      params[:experience] ||= {experienceable_type: params[:experienceable_type], experienceable_id: params[:experienceable_id]}
      params.require(:experience).permit(:description, :occurrence_date, :experienceable_id, :experienceable_type)
    end
end
