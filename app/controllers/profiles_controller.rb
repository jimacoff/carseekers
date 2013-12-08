class ProfilesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(profile_params)
    render :index
  end

  private
  def profile_params
    params.require(:profile).permit(:bio)
  end

end
