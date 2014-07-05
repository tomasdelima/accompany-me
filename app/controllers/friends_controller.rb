class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(user: current_user)
    assign_activity_attributes

    if @friend.save
      redirect_to friend_path(@friend)
    else
      params[:errors] = @friend.errors.messages
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def update
    assign_activity_attributes

    if @friend.save
      redirect_to friend_path(@friend)
    else
      params[:errors] = @friend.errors.messages
      render :edit
    end
  end

  def destroy
    @friend.destroy

    redirect_to user_path
  end



  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def assign_activity_attributes
    pf = params[:friend]

    if pf["last_accompanied(1i)"].present? && pf["last_accompanied(2i)"].present? && pf["last_accompanied(3i)"].present?
      last_accompanied = Date.new(
        pf["last_accompanied(1i)"].to_i,
        pf["last_accompanied(2i)"].to_i,
        pf["last_accompanied(3i)"].to_i
      )
    end

    @friend.assign_attributes(
      name:                    pf[:name],
      declared:                pf[:declared],
      last_accompanied:        last_accompanied,
      accompaniment_frequency: pf[:accompaniment_frequency].to_i
    )
  end
end
