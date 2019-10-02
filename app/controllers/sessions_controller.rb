class SessionsController < ApplicationController
  # skip_before_action :logged_in_status
  layout 'sessions'
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to feeds_path
      flash[:notice] = "ログインしました"
    else
      flash.now[:danger] = "メールアドレスもしくはパスワードが正しくありません。"
      render :new
    end
  end

  def destroy
    log_out
    flash[:notice] = "ログアウトしました"
    redirect_to login_path
  end
end