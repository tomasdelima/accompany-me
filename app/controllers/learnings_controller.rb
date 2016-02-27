class LearningsController < ApplicationController
  before_action :init_learning, only: [:new, :create]
  before_action :find_learning, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
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

    def init_learning
      @object = @learning = Learning.new(learning_attributes)
    end

    def find_learning
      @object = @learning = Learning.find(params[:id])
    end

    def learning_attributes
      params[:learning] ||= {learnable_type: params[:learnable_type], learnable_id: params[:learnable_id]}
      params.require(:learning).permit(:learnable_type, :learnable_id, :owner_id, :summary, :description)
    end
end
