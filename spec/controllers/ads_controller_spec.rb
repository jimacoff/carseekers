require 'spec_helper'
require 'carrierwave/test/matchers'

describe AdsController do

  before do
    @user = User.make!
  end

  describe "Post to create" do
    before do
      @title = "Audi TT Roadster"
      @valid_params = { :ad => {
        :title => @title
      }}

      post :create, @valid_params.merge(:user_id => @user.id)
    end

    it "should have created the ad" do
      Ad.count.should eq(1)
    end

    it "should have stored the information" do
      Ad.first.title.should include(@valid_params[:ad][:title])
    end
  end

  describe "Patch to update" do
    before do
      @previous_title = "Audi AFOUR"
      @new_title = "Audi A4"
      @ad = Ad.create(:title => @previous_title)
      @user.ads << @ad

      @valid_params = { :ad => {
        :title => @new_title
      }}

      patch :update, @valid_params.merge(:user_id => @user.id, :id => @user.ads.first.id)
    end

    it "should have modified the previous information" do
      @ad.reload
      @ad.title.should_not eq(@previous_title)
      @ad.title.should eq(@new_title)
    end
  end

  describe "Test CarrierWave" do

    describe CarPhotoUploader do
      include CarrierWave::Test::Matchers

      before do
        CarPhotoUploader.enable_processing = true
        @uploader = CarPhotoUploader.new(@user, :avatar)
        @uploader.store!(File.open("app/assets/images/car.jpg"))
      end

      after do
        CarPhotoUploader.enable_processing = false
        @uploader.remove!
      end

      context 'the thumb version' do
        it "should scale down a landscape image to be exactly 130 by 130 pixels" do
          @uploader.thumb.should have_dimensions(130, 130)
        end
      end

      context 'the small version' do
        it "should scale down a landscape image to fit within 200 by 200 pixels" do
          @uploader.small.should be_no_larger_than(200, 200)
        end
      end

    end
  end

  describe "Post to create with Cars, Makes, Models and friends!" do
    before do
      @ad = Ad.make!
      @valid_params = { :ad => {
        :title => @ad.title
      }}

      post :create, @valid_params.merge(:user_id => @user.id)

    end
  end

  describe "Create car with new Ad" do
    before do
      @ad = Ad.new
      @ad.car = Car.new
      @make = Make.make!
      @model = Model.make!
      @valid_params = { :ad => {
        :car_attributes => {
          :make_id => @make.id,
          :model_id => @model.id
        }
      }}

      post :create,  @valid_params.merge(:user_id => @user.id)
    end

    it "should have created a new car with the correct make and model" do
      Ad.first.car.make.name.should eq(@make.name)
      Ad.first.car.model.name.should eq(@model.name)
    end
  end

  describe "Post to create with bidding price" do
    before do
      @ad = Ad.make!
      @bid = Bid.make!
      @valid_params = { :ad => {
        :bids_attributes => [{
          :actual => @bid.actual,
          :highest => @bid.highest,
          :buy_now_price => @bid.buy_now_price
        }]
      }}
      post :create, @valid_params.merge(:user_id => @user.id)
    end

    it "should have the bid figures" do
      assigns(:ad).bids.first.actual.should eq(@bid.actual)
      assigns(:ad).bids.first.highest.should eq(@bid.highest)
      assigns(:ad).bids.first.buy_now_price.should eq(@bid.buy_now_price)
    end
  end

end
