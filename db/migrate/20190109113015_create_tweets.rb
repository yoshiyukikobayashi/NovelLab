class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :commenter
      t.text :body
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
