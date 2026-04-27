class GamesController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @user_games = @user.user_games.includes(:game)
  end
end
