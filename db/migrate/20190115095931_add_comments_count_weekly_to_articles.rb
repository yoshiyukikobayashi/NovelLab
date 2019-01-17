class AddCommentsCountWeeklyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :comments_count_total, :integer, null: false, default: 0
  end

end
