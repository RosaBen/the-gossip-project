class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :welcome, :show, :index ]
  def index
    @users = User.all
  end
  # path: users_path

  def welcome
@user = current_user
  end
  # path: users_welcome_path

  def show
    @user = User.find(params[:id])
     author = @user.author
    @gossips = author.present? ? author.gossips : []
  end
  # path: user_path(@user)

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city_id)
  end
end
