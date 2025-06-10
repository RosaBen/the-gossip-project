class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def welcome
    @user = User.find_by(id: session[:user_id])

    unless @user
      redirect_to login_path, alert: "Veuillez vous connecter"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
