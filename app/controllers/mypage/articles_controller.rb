class Mypage::ArticlesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @articles = target_user.articles || Article.all
    @tweets = @user.tweets.all
  end

  def show
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @article = target_user.articles.new
    @categories = [:純文学, :ミステリー, :青春, :恋愛, :ＳＦ, :ファンタジー, :ホラー, :ライトノベル, 
                      :経済, :政治, :歴史, :児童, :官能]
  end

  def edit
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:id])
    @categories = [:純文学, :ミステリー, :青春, :恋愛, :ＳＦ, :ファンタジー, :ホラー, :ライトノベル, 
                      :経済, :政治, :歴史, :児童, :官能]
  end

  def create
    @user = User.find(params[:user_id])
    @article = target_user.articles.create(article_params)

    if @article.save
      redirect_to mypage_user_articles_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @article = target_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to mypage_user_article_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to mypage_user_articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category, :status)
  end

  def search_params
    params.permit(:user_id)
  end

  def target_user
    User.find(search_params[:user_id])
  end

end
