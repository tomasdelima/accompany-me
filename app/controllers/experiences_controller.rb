class ExperiencesController < ApplicationController
  before_action :init_experience, only: [:new, :create]
  before_action :find_experience, only: [:show, :edit, :update, :destroy]
  before_action :assign_experience_attributes, only: [:create, :update]
  before_action :set_learnings, only: [:show, :update]

  def index
    @experiences = Experience.all
  end

  def new
  end

  def create
    if @experience.save
      redirect_to polymorphic_path(@experience.related_to)
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
      redirect_to experience_path(@experience)
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
      @experience = Experience.new(related_to_type: params[:related_to_type], related_to_id: params[:related_to_id])
      assign_experience_attributes if params[:experience]
    end

    def find_experience
      @experience = Experience.find(params[:id])
    end

    def assign_experience_attributes
      @experience.assign_attributes(experience_params)
      set_related_to
    end

    def set_related_to
      @experience.related_to ||= current_user
    end

    def experience_params
      params.require(:experience).permit(:description, :related_to_id, :related_to_type)
    end

    def set_learnings
      @learnings = current_user.learnings.where(related_to_id: params[:id], related_to_type: 'Experience')
    end
end
