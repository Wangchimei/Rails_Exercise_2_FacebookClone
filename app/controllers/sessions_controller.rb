class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      flash[:notice] = "ログインしました"
    else
      flash.now[:danger] = "メールアドレスもしくはパスワードが正しくありません。"
      render :new
    end
  end

  def destroy
    
  end
end
