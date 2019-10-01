module FeedsHelper
  def new_or_edit
    if action_name == "new" || action_name == "create" || action_name == "confirm"
      confirm_feeds_path
    elsif action_name == "edit"
      feed_path
    end
  end

  def button_text
    if action_name == "new"
       return "投稿"
    elsif action_name == "edit"
       return "保存"
    end
  end

  # def avatar(feed)
  #   @avatar = feed.user.avatar.url
  #   if @avatar.nil?
  #       @avatar_user = image_tag("default-user.png")
  #   else
  #       @avatar_user = image_tag(@avatar)
  #   end
  #   @avatar_user
  # end
end
