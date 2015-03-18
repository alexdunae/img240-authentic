class UsersController < ApplicationController
  before_action :lookup_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create!(user_params)
    redirect_after_success
  end

  def update
    @user.update(user_params)
    redirect_after_success
  end

  def destroy
    @user.destroy
    redirect_after_success('Poof! Gone!')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def lookup_user
    @user = User.find(params[:id])
  end

  def redirect_after_success(notice = nil)
    redirect_to(root_path, {notice: notice})
  end
end
