class AdsController < ApplicationController

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(ad_params)
    render :show
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :user_id)
  end
end
