class BidsController < ApplicationController

  def create
    @ad = Ad.find(bid_params[:ad_id])
    @newbid = Bid.create(bid_params)
    @ad.bids << @newbid
    @ad.save!
    @bid = Bid.new
    flash[:notice] = "Your bid has been processed."
    BidMailer.new_bid(@ad.user, @ad).deliver
    redirect_to user_ad_path(:user_id => @ad.user.id, :id => @ad.id)
  end

 private
  def bid_params
    params.require(:bid).permit(:ad_id, :highest)
  end

end
