class AddReaderRefToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :reader, foreign_key: true
  end
end
