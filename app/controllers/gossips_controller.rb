class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    puts @gossips[0]
  end
end
