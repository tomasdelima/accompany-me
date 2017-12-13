class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :init_user, only: [:create]
  before_action :find_user, only: [:home, :show, :update]
  before_action :assign_user_attributes, only: [:create, :update]

  def home
  end

  def create
    @user.signed_up = true
    if @user.save
      sign_in(:user, @user)
      redirect_to root_path
    else
      params[:errors] = @user.errors.messages
      render json: {errors: @user.errors.messages}, status: 422
    end
  end

  def show
  end

  def update
    redirect_to user_path
  end

  protected

    def init_user
      @object = @user = unsigned_up_friend || User.new
    end

    def unsigned_up_friend
      User.find_by(email: user_params[:email], signed_up: [false, nil])
    end

    def find_user
      @object = @user = current_user
    end

    def assign_user_attributes
      @user.assign_attributes(user_params)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone, :celphone, :address, :name, :observations, :birthdate, :age, :age_changed_at)
    end
end
