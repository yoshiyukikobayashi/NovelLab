class ArticlesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def search_params
    params.permit(:user_id)
  end

  def target_user
    User.find(search_params[:user_id])
  end
end
