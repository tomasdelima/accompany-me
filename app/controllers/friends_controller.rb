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

    redirect_to friend_path(@friend)
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
