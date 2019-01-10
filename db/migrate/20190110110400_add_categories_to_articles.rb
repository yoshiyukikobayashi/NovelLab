class AddCategoriesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :category, :integer
  end
end
