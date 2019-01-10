class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :category,  presence: true
  enum category: {純文学:1, ミステリー:2, 青春:3, 恋愛:4, SF:5, ファンタジー:6, ホラー:7, ライトノベル:8, 
                      経済:9, 政治:10, 歴史:11, 児童:12, 官能:13}
end
