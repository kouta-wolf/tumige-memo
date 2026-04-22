class SessionsController < ApplicationController
  def new
  end

  def create
    logger.debug "--- ログインボタンが押されました！ ---"

    render plain: params.inspect
  end
end
