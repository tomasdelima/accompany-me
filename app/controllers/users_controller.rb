class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    current_user.friends << Friend.create(name: params[:user][:friends][:name])
    redirect_to user_path
  end
end
