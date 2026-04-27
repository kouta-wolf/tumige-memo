class GamesController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @user_games = @user.user_games.includes(:game)
    # @reviews = @user.reviews.order(created_at: :desc).limit(5)
  end
end
