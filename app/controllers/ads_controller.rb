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

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(ad_params)
    render :nothing => :true
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :user_id)
  end
end
