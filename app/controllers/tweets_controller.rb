class TweetsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @tweet = @comment.tweets.create(tweet_params)

    redirect_to user_article_comment_path(@user, @article, @comment)
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:comment_id])
    @tweet = @comment.tweets.find(params[:id])
    @tweet.destroy

    redirect_to user_article_comment_path(@user, @article, @comment)
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:commenter, :body, :reader_id)
  end

  def search_params
    params.permit(:user_id)
  end

  def target_user
    User.find(search_params[:user_id])
  end

end