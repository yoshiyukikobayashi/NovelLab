class Tweet < ApplicationRecord
  belongs_to :comment
  belongs_to :reader
  
  counter_culture [:comment, :article], column_name: 'comments_count_total'
end
