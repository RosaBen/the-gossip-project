class UsersController < ApplicationController
  def index
    @users = User.all
  end
  # path: users_path

  def welcome
    @user = User.find_by(id: session[:user_id])

    unless @user
      redirect_to login_path, flash[:alert]= "Veuillez vous connecter"
    end
  end
  # path: users_welcome_path

  def show
    @user = User.find(params[:id])
  end
  # path: user_path(@user)

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city_id)
  end
end
