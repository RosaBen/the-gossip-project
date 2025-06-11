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
  unless session[:user_id]
    flash[:alert] = "🚫 Vous devez être connecté pour créer un gossip."
    redirect_to login_path and return
  end

  @gossip = Gossip.new(gossip_params)
  @gossip.user_id = session[:user_id]

  if @gossip.save
    flash[:notice] = "✅ Gossip bien créé !"
    redirect_to gossips_path
  else
    puts "Erreur(s) validation :"
    puts @gossip.errors.full_messages # ← DEBUG
    flash.now[:alert] = "❌ Remplis bien tous les champs."
    render :new, status: :unprocessable_entity
  end
end






  # ----------------------------------------------------------
  private

def gossip_params
  params.require(:gossip).permit(:title, :content)
end

end
