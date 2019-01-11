class SearchController < ApplicationController

  def index
    @categories = [["純文学", 1], ["ミステリー", 2], ["青春", 3], ["恋愛", 4], ["ＳＦ", 5], ["ファンタジー", 6], ["ホラー", 7], ["ライトノベル", 8], 
               ["経済", 9], ["政治", 10], ["歴史", 11], ["児童", 12], ["官能", 13]]
    @contents = []
    @users = User.all
    @articlecountall = Article.all.count
    @articles = params[:category].nil? ? Article.all : Article.search(params[:search], params[:category][:name])
    @articlecountself = @articles.count
    @articles.each do |article|
      @content = {}
      @content["article"] = article
      @content["user"] = @users.find_by(id: article.user_id)
      @contents.push(@content)
    end

  end
end
