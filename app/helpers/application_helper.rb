module ApplicationHelper

  def gravatar_picture_url(user, size=200)
    if user.picture_url.present?
      user.picture_url
    else
      default_url = "#{root_url}assets/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    end
  end

  #Devise from everywhere!

  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
