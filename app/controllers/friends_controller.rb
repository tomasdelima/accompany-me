class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(user: current_user)

    update_activity_attributes
    redirect_to friend_path(@friend)
  end

  def show
  end

  def edit
  end

  def update
    update_activity_attributes

    redirect_to friend_path(@friend)
  end

  def destroy
    @friend.destroy

    redirect_to user_path
  end



  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def update_activity_attributes
    pf = params[:friend]

    if pf["last_accompanied(1i)"].present? && pf["last_accompanied(2i)"].present? && pf["last_accompanied(3i)"].present?
      last_accompanied = Date.new(
        pf["last_accompanied(1i)"].to_i,
        pf["last_accompanied(2i)"].to_i,
        pf["last_accompanied(3i)"].to_i
      )
    end

    @friend.update_attributes(
      name:             pf[:name],
      declared:         pf[:declared],
      last_accompanied: last_accompanied
    )
  end
end
