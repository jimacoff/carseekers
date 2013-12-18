require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProfilesHelper. For example:
#
# describe ProfilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe ProfilesHelper do

  before do
    @user = User.make!
    @ad = Ad.make!
    @rating = Rating.make!
    @ad.rating = @rating
    @ad.winner_id = @user.id
    @ad.save!
  end

  it "should have the correct rating for the ad" do
    @user.wins.first.rating.rate.should eq(@rating.rate)
    @user.wins.first.rating.rate.should_not eq(2)
    @user.wins.first.rating.rate.should_not eq(1)
  end

  it "should have the correct quantity of rates for this user" do
    positives(@user.profile).should eq(1)
    neutrals(@user.profile).should eq(0)
    negatives(@user.profile).should eq(0)
  end

end
