class AdsController < ApplicationController

  def model_selector
    make = Make.find(params[:make][:id])
    @models = make.models
    respond_to do |format|
      format.html { render :nothing => :true }
      format.js { render :json => { :models => @models.as_json } }
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    binding.pry
    @ad = Ad.create(ad_params)
    render :show
  end

  def edit
    @ad = Ad.find(params[:id])
    @images_quantity = @ad.images.count
    @fields_quantity = 5 - @images_quantity
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(ad_params)
    render :show
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :description, :user_id, :images_attributes => [:carphoto, :id, :_destroy], :car => [:make => [:model]])
  end
end
