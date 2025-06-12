class CommentsController < ApplicationController
  # before_action :authenticate_user!  # 💡 devise or your own logic

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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
