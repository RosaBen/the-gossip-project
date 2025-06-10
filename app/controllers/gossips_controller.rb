class GossipsController < ApplicationController
  def index
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
