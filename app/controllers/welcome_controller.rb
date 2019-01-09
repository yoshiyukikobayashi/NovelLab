class WelcomeController < ApplicationController

  def index
    @contents = []
    @users = User.all
    @articles = Article.all
    @comments = Comment.all.order(created_at: :desc)
    @comments.each do |comment|
      @content = {}
      @content["comment"] = comment
      @content["article"] = @articles.find_by(id: comment.article_id)
      @content["user"] = @users.find_by(id: @articles.find_by(id: comment.article_id).user_id)
      @contents.push(@content)
    end
  end

end
