class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_friend, only: [:new, :create]
  before_action :find_friend, only: [:home, :show, :update, :edit]
  before_action :assign_friend_attributes, only: [:create, :update]

  def new
  end

  def create
    if @friend.save
      Friendship.create(user: current_user, friend: @friend)
      redirect_to friend_path(@friend)
    else
      params[:errors] = @friend.errors.messages
      render :new
    end
  end

  def show
  end

  def update
    if @friend.save
      redirect_to friend_path
    else
      params[:errors] = @friend.errors.messages
      render :edit
    end
  end

  protected

    def init_friend
      @object = @friend = Friend.new(email: params[:email])
    end

    def find_friend
      @object = @friend = Friend.find(params[:id])
    end

    def assign_friend_attributes
      @friend.assign_attributes(friend_params)
    end

    def friend_params
      params.require(:friend).permit(:email, :phone, :celphone, :address, :name, :observations, :birthdate, :age, :age_changed_at)
    end
end
