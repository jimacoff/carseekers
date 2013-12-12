class BidsController < ApplicationController

  def create
    @ad = Ad.find(bid_params[:ad_id])
    @newbid = Bid.create(bid_params)
    @ad.bids << @newbid
    @ad.save!
    @bid = Bid.new
    redirect_to user_ad_path(:user_id => @ad.user.id, :id => @ad.id)
  end

 private
  def bid_params
    params.require(:bid).permit(:ad_id, :actual, :highest, :buy_now_price)
  end

end