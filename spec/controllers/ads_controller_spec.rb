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

end
