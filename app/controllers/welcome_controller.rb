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
    
    @tweetscountofarticle = 0
    @articles = Article.all
    @articles.each do |article|
      article.comments.each do |comment|
        @tweetscountofarticle += comment.tweets.where(created_at: 1.weeks.ago..Time.now).count
      end
      article.update(comment_count_weekly: @tweetscountofarticle)
      @tweetscountofarticle = 0
    end
    @contents2 = []
    @articles = Article.all.order(comment_count_weekly: :desc).limit(10)
    @articles.each do |article|
      @content2 = {}
      @content2["article"] = article
      @content2["user"] = @users.find_by(id: article.user_id)
      @contents2.push(@content2)
    end
    
    @contents3 = []
    @articles = Article.all.order(comments_count_total: :desc).limit(10)
    @articles.each do |article|
      @content3 = {}
      @content3["article"] = article
      @content3["user"] = @users.find_by(id: article.user_id)
      @contents3.push(@content3)
    end

  end

end