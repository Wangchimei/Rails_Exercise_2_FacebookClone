module ApplicationHelper
  def avatar(user)
    @avatar = user.avatar.url
    if @avatar.nil?
      @avatar_user = image_tag("default-user.png")
    else
      @avatar_user = image_tag(@avatar)
    end
    @avatar_user
  end
end