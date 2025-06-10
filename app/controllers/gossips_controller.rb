class GossipsController < ApplicationController
  def index
        unless session[:user_id]
      redirect_to login_path, alert: "Veuillez vous connecter"
      return
        end
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

def create
  @gossip = Gossip.new(gossip_params)
  @gossip.user_id = session[:user_id]

  if @gossip.save
    redirect_to @gossip
  else
    render :new, status: :unprocessable_entity
  end
end


  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end
