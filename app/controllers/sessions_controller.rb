class SessionsController < ApplicationController
  layout "auth"

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_dashboard_path, notice: "ログインしました"
    else
      flash.now[:alert] = "ログインに失敗しました"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました", status: :see_other
  end
end
