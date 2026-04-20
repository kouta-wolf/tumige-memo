class Review < ApplicationRecord
  belongs_to :user_game

  validates :user_game_id, uniqueness: true
end
