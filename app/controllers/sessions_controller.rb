class SessionsController < ApplicationController
  # skip_before_action :logged_in_status
  layout 'session'
  
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to feeds_path
      flash[:notice] = "ログインしました"
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが違います"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end