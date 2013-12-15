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
          :highest => @bid.highest,
          :ad_id => @ad.id
        }
      }
      post :create, @valid_params
    end

    it "should have the bid figures" do
      assigns(:ad).bids.last.highest.should eq(@bid.highest)
    end
  end

end
