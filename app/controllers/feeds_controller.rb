class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  
  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def new
    @feed = Feed.new
  end

  def create

  end

  def show; end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :content, :image)
  end
end
