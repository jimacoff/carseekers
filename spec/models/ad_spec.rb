# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  description    :text
#  starting_price :float
#  buy_now_price  :float
#  ends           :date
#  active         :boolean
#

require 'spec_helper'

describe Ad do
  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:images) }
    it { should have_one(:car) }
    it { should have_many(:bids) }
  end

  before do
    @ad = Ad.make!
  end

  context "Ad will always have 5 images, even if they are empty" do
    before do
      @ad = Ad.make!
      @ad.images.first.destroy
      @ad.save!
    end

    it "should have 5 images" do
      @ad.images.count.should eq(5)
    end
  end

  context "Create new bid and set highest and buy now price when new Ad" do
    it "should have a new associated bid with the starting price as highest bid" do
      Bid.maximum('highest').should eq(@ad.starting_price)
    end
  end

  context "Highest bid for this ad" do
    before do
      @ad2 = Ad.make!(:title => "Mercedes SLK", :starting_price => "7000.00")
    end

    it "should have the highest bid for that particular AD, not the highest from all the ADs" do
      @ad.top_bid.should eq(@ad.bids.first.highest)
      @ad.top_bid.should_not eq(@ad2.bids.first.highest)
    end
  end

  context "Ad active" do
    before do
      @expired = Ad.make!(:expired)
    end

    it "the active ad should be active :)" do
      @ad.active?.should eq(true)
      @ad.active?.should_not eq(false)
    end

    it "the expired ad should be NOT active" do
      @expired.active?.should_not eq(true)
    end
  end
end
