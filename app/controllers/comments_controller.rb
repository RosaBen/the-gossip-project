class CommentsController < ApplicationController
    before_action :set_gossip
  before_action :set_comment, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Commentaire ajouté avec succès."
    else
      flash[:alert] = "Erreur : commentaire non valide."
    end
    redirect_to gossip_path(@gossip)
  end

    def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to gossip_path(@gossip), notice: "Commentaire mis à jour !"
    else
      render :edit, alert: "Erreur lors de la mise à jour."
    end
  end

  def destroy
    @comment.destroy
    redirect_to gossip_path(@gossip), notice: "Commentaire supprimé."
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def set_comment
    @comment = @gossip.comments.find(params[:id])
  end

  def authorize_user!
    unless current_user == @comment.user
      redirect_to gossip_path(@gossip), alert: "Tu n'as pas le droit de modifier ce commentaire."
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
