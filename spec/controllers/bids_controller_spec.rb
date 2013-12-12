require 'spec_helper'

describe BidsController do

  before do
    @user = User.make!
  end

  describe "Post to create with bidding price" do

    before do
      @ad = Ad.make!
      @user.ads << @ad
      @bid = Bid.make!
      @valid_params = { :bid => {
          :actual => @bid.actual,
          :highest => @bid.highest,
          :buy_now_price => @bid.buy_now_price,
          :ad_id => @ad.id
        }
      }
      post :create, @valid_params.merge(:user_id => @user.id)
    end

    it "should have the bid figures" do
      assigns(:ad).bids.first.actual.should eq(@bid.actual)
      assigns(:ad).bids.first.highest.should eq(@bid.highest)
      assigns(:ad).bids.first.buy_now_price.should eq(@bid.buy_now_price)
    end
  end

end
