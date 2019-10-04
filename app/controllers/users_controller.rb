class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  # skip_before_action :logged_in_status,only:[:new, :create]
  layout 'session', only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      flash[:notice] = "登録が完了しました。もう一度ログインしてください。"
    else
      render :new
    end
  end

  def edit
    render layout: 'user'
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "情報が更新しました"
      redirect_to user_path(@user.id) and return
      render layout: 'user'
    else
      render :edit
    end
  end
  
  def show
    if logged_in?
      if current_user != @user
        redirect_to user_path(current_user) and return
        # render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
      end
    else
      redirect_to new_session_path and return
    end
    render layout: 'user'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
