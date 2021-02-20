class WordUser < ApplicationRecord
  belongs_to :word
  belongs_to :user
end
