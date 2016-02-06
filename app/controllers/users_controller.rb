class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @learnings = current_user.learnings
  end

  def update
    current_user.friends << Friend.create(name: params[:user][:friends][:name])
    redirect_to user_path
  end
end
