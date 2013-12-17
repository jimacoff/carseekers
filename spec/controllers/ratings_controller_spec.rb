require 'spec_helper'

describe RatingsController do

  before do
    @seller = User.make!
    @buyer = User.make!
  end

  context "create the rate for the correct rateable model" do
    before do

      @comment = Faker::Lorem.words(rand(2..4)).join(' ')
      @rate = 3

      @valid_params = { :rating => {
        :comment => @comment,
        :rate => @rate,
        :rateable_id => @buyer.id,
        :rateable_type => "User"
      }}

      post :create, @valid_params
    end

    it "should have the correct rating" do
      @buyer.reload
      @buyer.ratings.first.rate.should eq(@rate)
      @buyer.ratings.first.comment.should eq(@comment)
    end
  end

end
