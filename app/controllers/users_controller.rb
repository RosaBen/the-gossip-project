class UsersController < ApplicationController
  def index
    @users = User.all
  end
  # path: users_path
  # ou path: users_index_path
  # ----------------------------------------------------------

  def welcome
    @user = User.find_by(id: session[:user_id])

    unless @user
      redirect_to login_path, flash.now[:alert]= "Veuillez vous connecter"
    end
  end
  # path: users_welcome_path
  # ou path: welcome_user_path
  # ----------------------------------------------------------

  def show
    @user = User.find(params[:id])
  end
  # path: users_show_path
  #  ou path: show_user_path
  # ----------------------------------------------------------
end
