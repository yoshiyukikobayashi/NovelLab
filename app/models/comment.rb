class Comment < ApplicationRecord
  has_many :tweets
  belongs_to :article
  
  def previous(articleid)
    Comment.where("id < ? AND article_id == ?", self.id, articleid).order("id DESC").first
  end
 
  def next(articleid)
    Comment.where("id > ? AND article_id == ?", self.id, articleid).order("id ASC").first
  end
end
