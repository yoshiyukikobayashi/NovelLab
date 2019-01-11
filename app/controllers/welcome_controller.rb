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
    
    @contents1 = []
    @articles = Article.all.order("RANDOM()").where(status: true)
    @articles.each do |article|
      @content1 = {}
      @content1["article"] = article
      @content1["user"] = @users.find_by(id: article.user_id)
      @contents1.push(@content1)
    end
  end

end
