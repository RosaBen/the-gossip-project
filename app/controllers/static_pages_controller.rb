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
  @gossips_data = @gossips.each_with_index.map do |gossip, index|
    {
      gossip: gossip,
      color: ['#fffd82', '#ffc9de', '#c9f2ff', '#d1ffc9', '#ffe0ac'][index % 5],
      rotation: [-5, 3, -2, 4, -4][index % 5],
      top: rand(0..150),
      left: rand(0..300),
      z: 10 - index
    }
  end
end

  # path: home
  # ----------------------------------------------------------
end
