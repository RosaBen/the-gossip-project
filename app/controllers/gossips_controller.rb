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
  @gossip = Gossip.new(
    title: params[:title],
    content: params[:content],
    user_id: session[:user_id]
  )

  if @gossip.save
    redirect_to gossips_path
  else
    render :new
  end
end
end
