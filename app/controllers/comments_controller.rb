class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :destroy]

  def create
    @comment = @feed.comments.create(comment_params)
    # @comment = @feed.comments
    #   .create(content: params[:comment][:content],
    #           feed_id: @feed.id,
    #           user_id: current_user.id)
    redirect_to feed_path(@feed)
  end

  def destroy
    @comment = @feed.comments.find(params[:id])
    @comment.destroy
    redirect_to feed_path(@feed)
  end

  private

  def set_blog
    @feed = Feed.find(params[:feed_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :feed_id, :user_id)
  end
end
