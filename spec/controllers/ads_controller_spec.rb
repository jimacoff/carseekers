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
        :title => @title,
        :user_id => @user.id
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
      @ad = Ad.make!(:complete)
      @ad.title = @previous_title

      @valid_params = { :ad => {
        :title => @new_title
      }}

      patch :update, @valid_params.merge(:user_id => @ad.user.id, :id => @ad.id)
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
        :user_id => @user.id,
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

  describe "Delete to destroy" do
    before do
      @ad = Ad.make!

      delete :destroy, { :id => @ad.id, :user_id => @user.id }
    end

    it "should have removed the ad" do
      Ad.count.should eq(0)
    end
  end

end
