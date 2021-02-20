class Word < ApplicationRecord
  has_many :word_users, dependent: :destroy
  has_many :users, through: :word_users
end
