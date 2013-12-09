require 'spec_helper'

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

end
