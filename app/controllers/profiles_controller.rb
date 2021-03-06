class ProfilesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @ads = @user.ads
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(profile_params)
    @ads = @profile.user.ads
    render :index
  end

  private
  def profile_params
    params.require(:profile).permit(:bio)
  end

end
