module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end
  
  # def logged_in_status
  #   unless logged_in?
  #     flash[:danger] = "ログインが必要です。"
  #     redirect_to new_session_path
  #   end
  # end
end