# == Schema Information
#
# Table name: ads
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
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

  context "ad will always have 5 images, even if they are empty" do
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
end
