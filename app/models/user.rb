class User < ApplicationRecord
  has_secure_password

  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  has_many :reviews, through: :user_games

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
