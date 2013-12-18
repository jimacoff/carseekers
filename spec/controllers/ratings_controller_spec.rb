require 'spec_helper'

describe RatingsController do

  before do
    @ad = Ad.make!
  end

  context "create the rate for the correct rateable model" do
    before do

      @comment = Faker::Lorem.words(rand(2..4)).join(' ')
      @rate = 3

      @valid_params = { :rating => {
        :comment => @comment,
        :rate => @rate,
        :rateable_id => @ad.id,
        :rateable_type => "Ad"
      }}

      post :create, @valid_params
    end

    it "should have the correct rating" do
      @ad.reload
      @ad.rating.rate.should eq(@rate)
      @ad.rating.comment.should eq(@comment)
    end
  end

end
