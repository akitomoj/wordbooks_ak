class Word < ApplicationRecord
  has_many :word_users
  has_many :users, through: :word_users
end
