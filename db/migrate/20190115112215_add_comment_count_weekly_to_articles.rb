class AddCommentCountWeeklyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :comment_count_weekly, :integer
  end
end
