class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "情報が更新しました"
    else
      render :edit
    end
  end
  
  def show
    if session[:user_id] != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
