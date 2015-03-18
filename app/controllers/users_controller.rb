class UsersController < ApplicationController
  before_action :lookup_user, only: [:edit, :update, :destroy]
  before_action :ensure_admin, only: [:index, :destroy]
  before_action :ensure_current_user, only: [:edit, :update]

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
    sign_in_user(@user)
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

  def ensure_current_user
    if current_user == @user
      true
    else
      redirect_to root_path, error: 'Not allowed'
    end
  end

  def redirect_after_success(notice = nil)
    redirect_to(root_path, {notice: notice})
  end
end
