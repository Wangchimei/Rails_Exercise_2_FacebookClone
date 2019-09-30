class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  
  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if params[:back]
      render :new
    else 
      if @feed.save
        redirect_to feeds_path
        flash[:notice] = "#{@feed.title}を投稿されました"
      else
        render :new
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path
      flash[:notice] = "#{@feed.title}が更新されました"
    else
      render :edit
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    render :new if @feed.invalid?
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :content, :image, :user_id)
  end
end
