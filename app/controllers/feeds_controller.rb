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
    if @feed.save
      redirect_to feeds_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path
    else
      render :edit
    end
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
