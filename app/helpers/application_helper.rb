module ApplicationHelper

  def rate
    [['Negative', 1], ['Neutral', 2], ['Positive', 3]]
  end

  def end_date
    [['1 Day', 1], ['7 Days', 7], ['30 Days', 30]]
  end

  def fuel_type
    ['Petrol', 'Diesel', 'Electric', 'Hybrid']
  end

  def style
    ['Small cars', 'Medium cars', 'Large cars', 'MPV', 'Cabriolet', 'Coupe', 'SUV', 'State']
  end

  def color
    ['Red', 'Blue', 'Black', 'Yellow', 'Silver', 'Grey', 'Orange', 'Green', 'White']
  end

  def engine
    ['< 1000cc', '1000cc - 1500cc', '1500cc - 2000cc', '2000cc - 2500cc', '2500cc - 3500cc', '> 3500cc']
  end

  def power
    ['< 30hp', '30hp - 50hp', '50hp - 90hp', '90hp - 140hp', '140hp - 200hp', '200hp - 300hp', '> 300hp' ]
  end

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
