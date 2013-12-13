class AdsController < ApplicationController

  def model_selector
    make = Make.find(params[:make][:id])
    @models = make.models
    respond_to do |format|
      format.html { render :nothing => :true }
      format.js { render :json => { :models => @models.as_json } }
    end
  end

  def index
    #@ads = Ad.paginate(:page => params[:page], :per_page => 5)
    @ads = Ad.where(:active => true).paginate(:page => params[:page], :per_page => 5).order('id ASC')
  end

  def show
      @ad = Ad.find(params[:id])
      @bid = Bid.new
      @message = Message.new
    unless @ad.active?
      flash[:alert] = "This Ad has expired"
      redirect_to user_profiles_path(current_user)
    end
  end

  def new
    @ad = Ad.new
    @ad.car = Car.new
    @ad.bids << Bid.new
    5.times { @ad.images << Image.new }
  end

  def create
    @ad = Ad.create(ad_params)
    @ad.ends = Time.now + ad_params[:ends].to_i.days
    @ad.save!
    @message = Message.new
    @bid = Bid.new
    render :show
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(ad_params)
    @bid = Bid.new
    @message = Message.new
    render :show, :id => @ad.id
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy!
    redirect_to root_path
  end

  private
  def ad_params
    params.require(:ad).permit(:title, :description, :user_id, :starting_price, :buy_now_price, :ends, :images_attributes => [:carphoto, :id, :_destroy], :car_attributes => [:make_id, :model_id, :engine, :hp, :fuel_type, :age, :style, :color], :bids_attributes => [:actual, :highest, :buy_now_price])
  end
end
