class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      sign_in_user(user)
      redirect_to root_path, notice: 'Hi, friend!'
    else
      redirect_to root_path, notice: 'No way!'
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
