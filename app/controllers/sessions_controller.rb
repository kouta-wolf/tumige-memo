class SessionsController < ApplicationController
  layout "auth"

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to games_index_path, notice: "ログインしました"
    else
      flash.now[:alert] = "ログインに失敗しました"
      render "new", status: :unprocessable_entity
    end
  end
end
