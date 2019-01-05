class Mypage::CommentsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.new
  end

  def edit
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to mypage_user_article_path(@user, @article)
  end

  def update
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    
    if @comment.update(comment_params)
      redirect_to mypage_user_article_comment_path(@user, @article, @comment)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to mypage_user_article_path(@user, @article)
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
