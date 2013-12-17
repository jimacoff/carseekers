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
#  mailed         :boolean
#  latitude       :float
#  longitude      :float
#  postcode       :string(255)
#  city           :string(255)
#

require 'spec_helper'

describe Ad do
  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:images) }
    it { should have_one(:car) }
    it { should have_many(:bids) }
    it { should have_many(:messages) }
  end

  before do
    @ad = Ad.make!
    @ad2 = Ad.make!(:complete)
    @car = Car.make!
    @ad3 = Ad.make!
    @ad3.car = Car.make!(:v2)
    @ad3.car.make = Make.make!(:name => "Seat")
    @ad3.car.model = Model.make!(:name => "Panda")
    @ad3.car.save!
    @ad3.save!
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

  context "Scoped attributes will filter the results" do
    before do
      @engine = Ad.by_engine(@ad2.car.engine)
      @age = Ad.by_age(@ad2.car.age)
      @hp = Ad.by_hp(@ad2.car.hp)
      @color = Ad.by_color(@ad2.car.color)
      @style = Ad.by_style(@ad2.car.style)
    end

    it "should have find the previous car by different types" do
      @engine.should eq([@ad, @ad2])
      @age.should eq([@ad, @ad2])
      @hp.should eq([@ad, @ad2])
      @color.should eq([@ad, @ad2])
      @style.should eq([@ad, @ad2])
    end

    it "should have not finded the car with different values" do
      @fuel.should_not eq(@ad3)
      @engine.should_not eq(@ad3)
      @age.should_not eq(@ad3)
      @hp.should_not eq(@ad3)
      @color.should_not eq(@ad3)
      @style.should_not eq(@ad3)
    end
  end

  context "Scoped relationships will filter through" do
    before do
      @car = Car.make!(:complete)
      @car2 = Car.make!(:v2)
      @car2.make = Make.make!(:name => "Seat")
      @car2.model = Model.make!(:name => "Panda")
      @ad.car = @car
      @ad.save!
      @ad2 = Ad.make!
      @ad2.car = @car2
      @ad2.save!
    end

    it "should have the correct list of cars from the same make" do
      Ad.with_make(@car.make.id).should eq([@ad])
      Ad.with_make(@car.make.id).should_not eq([@ad2])
    end

    it "should have the correct list of cars from the same make" do
      Ad.with_model(@car.model.id).should eq([@ad])
      Ad.with_model(@car.model.id).should_not eq([@ad2])
    end
  end

  context "Top bidder returns the user with the maximum bid" do
    before do
      @highest_amount = 2500.00
      @lowest_amount = 2000.00
      @bidder_max = User.make!
      @bidder_min = User.make!

      @highest_bid = Bid.make!(:user_id => @bidder_max.id, :highest => @highest_amount)
      @lowest_bid = Bid.make!(:user_id => @bidder_min.id, :highest => @lowest_amount)

      @ad.bids << @highest_bid
      @ad.bids << @lowest_bid
      @ad.save!
    end

    it "should return the maximum bidder" do
      @ad.top_bidder.should eq(@bidder_max)
      @ad.top_bidder.should_not eq(@bidder_min)
    end
  end
end
