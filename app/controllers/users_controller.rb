class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show
  end

  def update
    @user.friends << Friend.create(name: params[:user][:friends][:name])
    redirect_to user_path
  end

  protected

    def find_user
      @object = @user = User.find(params[:id]) rescue current_user
    end
end
