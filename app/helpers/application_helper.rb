module ApplicationHelper

  def gravatar_picture_url(user, size=200)
    if user.picture_url.present?
      user.picture_url
    else
      default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{default_url}"
    end
  end

end
