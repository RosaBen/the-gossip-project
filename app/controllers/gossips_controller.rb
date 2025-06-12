class GossipsController < ApplicationController
  # before_action :authenticate_user!


  def index
    @gossips = Gossip.order(created_at: :desc)
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    puts "PARAMS ----------"
    puts params.inspect
    puts "-----------------"

    user = current_user
    @gossip = Gossip.new(gossip_params)
    @gossip.user = user

    author = nil

    if params[:anonymous] == "1"
      # Crée un auteur anonyme global sans user_id
      author = Author.find_or_create_by(first_name: "Anonymous", last_name: "") do |a|
        a.user_id = nil
      end
    elsif params[:is_me] == "1"
      author = Author.find_or_create_by(
        first_name: user.first_name,
        last_name: user.last_name,
        user_id: user.id
      )
    elsif params[:new_author_name].present?
      first_name, last_name = params[:new_author_name].split(" ", 2)
      author = Author.create(first_name: first_name, last_name: last_name, user_id: user.id)
    elsif params[:gossip][:author_id].present?
      author_id = params[:gossip][:author_id].to_i

      # Supporte UserAsAuthor (id négatif)
      if author_id < 0
        user_author = User.find(-author_id)
        author = Author.find_or_create_by(
          first_name: user_author.first_name,
          last_name: user_author.last_name,
          user_id: user_author.id
        )
      else
        author = Author.find_by(id: author_id)
      end
    end

    if author.nil?
      flash.now[:alert] = "❌ Aucun auteur sélectionné"
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

  def edit
  @gossip = Gossip.find(params[:id])
end

  def update
  @gossip = Gossip.find(params[:id])
  if @gossip.update(gossip_params)
    flash[:notice] = "✅Le gossip a bien été mis à jour."
    redirect_to gossip_path(@gossip)
  else
    flash.now[:alert] = "❌Erreur lors de la mise à jour du gossip."
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
  @gossip = Gossip.find(params[:id])
  if @gossip.destroy
    flash[:notice] = "Le gossip a bien été supprimé."
    redirect_to gossips_path
  else
    flash[:alert] = "Une erreur est survenue lors de la suppression."
    redirect_to gossip_path(@gossip)
  end
  end


  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :author_id) # Ajout author_id pour éviter warning
  end
end
