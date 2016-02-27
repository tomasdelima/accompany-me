class LearningsController < ApplicationController
  before_action :set_learning, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @learning = Learning.new
  end

  def create
    @learning = Learning.new(learning_attributes)

    if @learning.save
      redirect_to learning_path(@learning)
    else
      params[:errors] = @learning.errors.messages
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def update
    @learning.assign_attributes(learning_attributes)
    if @learning.save
      redirect_to learning_path(@learning)
    else
      params[:errors] = @learning.errors.messages
      render :edit
    end
  end

  def destroy
    @learning.destroy
    redirect_to user_path
  end

  private

    def set_learning
      @learning = Learning.find(params[:id])
    end

    def learning_attributes
      params.require(:learning).permit(:owner_id, :summary, :description)
    end
end
