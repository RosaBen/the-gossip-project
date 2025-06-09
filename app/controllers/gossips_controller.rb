class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    puts @gossips[0]
  end
  def show
    @gossip = Gossip.find(params[:id])
  end
end
