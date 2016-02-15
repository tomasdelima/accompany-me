class LearningsController < ApplicationController
  before_action :set_learning, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @learning = Learning.new(related_to_type: params[:related_to_type], related_to_id: params[:related_to_id])
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
      params[:learning][:owner_id] = current_user.id
      # debugger
      if (params[:learning][:related_to_id].empty?)
        params[:learning][:related_to_id] = current_user.id
        params[:learning][:related_to_type] = current_user.class.to_s
      end
      params.require(:learning).permit(:owner_id, :summary, :description, :related_to_id, :related_to_type)
    end
end
