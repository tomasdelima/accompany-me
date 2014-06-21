class FriendsController < ApplicationController
  before_action :set_friend, only: :show

  def new
  end

  def show
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
