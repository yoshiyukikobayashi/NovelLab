class Tweet < ApplicationRecord
  belongs_to :comment
  belongs_to :reader
end
