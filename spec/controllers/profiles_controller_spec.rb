require 'spec_helper'

describe ProfilesController do

  describe "GET to show" do
    before do
      @user = User.make!

      get :show, :id => @user.profile.id, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end
  end

end
