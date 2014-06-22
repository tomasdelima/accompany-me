class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update]

  def new
  end

  def show
  end

  def edit
  end

  def update
    pf = params[:friend]

    @friend.update_attributes(
      name:     pf[:name],
      declared: pf[:declared]
    )

    redirect_to friend_path(@friend)
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
