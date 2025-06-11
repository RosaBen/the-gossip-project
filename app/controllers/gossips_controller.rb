class GossipsController < ApplicationController
  before_action :require_login

def require_login
  unless session[:user_id]
    flash[:alert] = "🚫 Connecte-toi d'abord."
    redirect_to login_path
  end
end

  def index
@gossips = Gossip.order(created_at: :desc)
  end
  # path: gossips_path
  # ou path: gossips_index_path
  # ----------------------------------------------------------
  def show
    @gossip = Gossip.find(params[:id])
  end
  # path: gossips_show_path
  # ou path: show_gossip_path

  # ----------------------------------------------------------
  def new
    @gossip = Gossip.new
  end
# path: gossips_new_path
#  ou path: new_gossip_path

# ----------------------------------------------------------

def create
  user = User.find(session[:user_id]) # 👈 current_user

  @gossip = Gossip.new(gossip_params)
  @gossip.user = user # 👈 créateur du gossip (toujours)

  # 👇 Choix de l'auteur affiché dans le gossip :
  if params[:anonymous] == "1"
    author = Author.find_or_create_by(first_name: "Anonymous", last_name: "", user_id: user.id)
  elsif params[:is_me] == "1"
    author = Author.find_or_create_by(first_name: user.first_name, last_name: user.last_name, user_id: user.id)
  elsif params[:new_author_name].present?
    first_name, last_name = params[:new_author_name].split(" ", 2)
    author = Author.create(first_name: first_name, last_name: last_name, user_id: user.id)
  elsif params[:gossip][:author_id].present?
    author_id = params[:gossip][:author_id].to_i

    if author_id < 0
      user_author = User.find(-author_id)
      author = Author.find_or_create_by(first_name: user_author.first_name, last_name: user_author.last_name, user_id: user.id)
    else
      author = Author.find(author_id)
    end
  else
    flash.now[:alert] = "Aucun auteur sélectionné"
    render :new, status: :unprocessable_entity and return
  end

  @gossip.author = author

  if @gossip.save
    flash[:notice] = "✅ Gossip bien créé !"
    redirect_to gossip_path(@gossip)
  else
    flash.now[:alert] = "❌ Remplis bien tous les champs."
    render :new, status: :unprocessable_entity
  end
end


private

def gossip_params
  params.require(:gossip).permit(:title, :content)
end
end
