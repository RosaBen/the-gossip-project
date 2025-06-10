class SessionsController < ApplicationController
  def new
  end

def create
  user = User.find_by_full_name(params[:first_name], params[:last_name])

  if user
    session[:user_id] = user.id
    redirect_to welcome_user_path(first_name: user.first_name, last_name: user.last_name)

  else
    flash.now[:alert] = "Utilisateur introuvable"
    render :new, status: :unprocessable_entity
  end
end


  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Déconnecté avec succès"
  end
end
