class StaticPagesController < ApplicationController
  def contact
  end
  # path: contact
  # ----------------------------------------------------------

  def team
    @team_members = [
      { name: "Mathieu",     quote: "Qui sème le vent récolte la tempête.",        image: "avatar1.png" },
      { name: "Rosa",      quote: "La curiosité est un vilain défaut.",          image: "avatar2.png" },
      { name: "Bernadette",    quote: "Rien ne sert de courir, il faut partir à point.", image: "avatar3.png" },
      { name: "Florian",   quote: "Mieux vaut tard que jamais.",                 image: "avatar4.png" },
      { name: "Théo",    quote: "L’union fait la force.",                      image: "avatar5.png" },
      { name: "Melody",    quote: "On ne change pas une équipe qui gagne.",     image: "avatar6.png" }
    ]
  end

  # path: team
  # ----------------------------------------------------------
  def home
    @gossips = Gossip.order("RANDOM()").limit(5)
  end
  # path: home
  # ----------------------------------------------------------
end
