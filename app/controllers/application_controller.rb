class ApplicationController < ActionController::Base
  before_action :logged_in_status

  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_status
    unless logged_in?
      flash[:danger] = "ログインが必要です。"
      redirect_to new_session_path
    end
  end

end
