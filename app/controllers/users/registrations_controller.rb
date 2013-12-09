class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if session["devise.google_data"]
      build_resource(
        :email => session["devise.google_data"].info.email,
        :password => sign_up_params[:password],
        :google_id => session["devise.google_data"].uid,
        :google_token => session["devise.google_data"].credentials.token,
        :picture_url => session["devise.google_data"].info.image,
        :name => session["devise.google_data"].info.name,
        :nick => sign_up_params[:nick]
      )
    else
      build_resource(
        :email => sign_up_params[:email],
        :password => sign_up_params[:password],
        :name => sign_up_params[:name],
        :nick => sign_up_params[:nick]
      )
    end
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :picture_url, :google_token, :google_id, :nick]
      devise_parameter_sanitizer.for(:account_update) << [:name, :picture_url, :google_token, :google_id, :nick]
  end

end