class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_one :review, dependent: :destroy
  validates :user_id, uniqueness: { scope: :game_id }

  enum :status, { not_played: 0, playing: 1, played: 2 }
end
