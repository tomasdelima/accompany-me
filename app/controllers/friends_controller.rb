class FriendsController < ApplicationController
  before_action :init_friend, only: [:new, :create]
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  before_action :assign_activity_attributes, only: [:create, :update]
  before_action :set_learnings, only: [:show, :update]

  def index
  end

  def new
  end

  def create
    if @friend.save
      redirect_to friend_path(@friend)
    else
      params[:errors] = @friend.errors.messages
      render :edit
    end
  end

  def show
    @model_name = 'Friend'
  end

  def edit
  end

  def update
    if @friend.save
      redirect_to friend_path(@friend)
    else
      params[:errors] = @friend.errors.messages
      render :edit
    end
  end

  def destroy
    @friend.delete

    redirect_to user_path
  end

  private
    def init_friend
      @friend = Friend.new(user: current_user)
    end

    def set_friend
      @friend = Friend.find(params[:id])
    end

    def set_learnings
      @learnings = current_user.learnings.where(related_to_id: params[:id], related_to_type: 'Friend')
    end

    def assign_activity_attributes
      params.require(:friend).permit!
      @friend.assign_attributes(params[:friend])
    end
end
