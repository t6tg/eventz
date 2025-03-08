module LikesHelper
  def like_or_unlike_button(event, liked)
    if liked
     button_to "⭐️ Unlike", event_like_path(event, liked), method: :delete
    else
     button_to "⭐️ Like", event_likes_path(event)
    end
  end
end
