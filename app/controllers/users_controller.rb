class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @articles = target_user.articles.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "作者ページへようこそ!"
      redirect_to mypage_user_articles_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def search_params
    params.permit(:id)
  end

  def target_user
    User.find(search_params[:id])
  end


end
