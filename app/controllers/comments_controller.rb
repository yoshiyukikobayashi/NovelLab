class CommentsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  private
  
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
  
  def search_params
    params.permit(:user_id)
  end

  def target_user
    User.find(search_params[:user_id])
  end

end
