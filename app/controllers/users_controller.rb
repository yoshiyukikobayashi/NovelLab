class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @articles = @user.articles.all
    if @user.save
      flash[:success] = "作者ページへようこそ!"
      redirect_to user_articles_path(@user, @articles)
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end  

end
