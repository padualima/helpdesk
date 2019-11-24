class Backoffice::UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    # code
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to backoffice_users_path
    end
  end

  def update
    if @user.update(users_params)
      redirect_to backoffice_users_path
    end
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :username, :sector_id ,:email, :password, :password_confirmation)
  end
end
