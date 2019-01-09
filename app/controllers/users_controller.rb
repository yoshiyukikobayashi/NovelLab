class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = target_user.articles.all
  end

  private

  def search_params
    params.permit(:id)
  end

  def target_user
    User.find(search_params[:id])
  end


end
