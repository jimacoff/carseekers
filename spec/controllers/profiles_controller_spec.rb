require 'spec_helper'

describe ProfilesController do

  before do
    @user = User.make!
  end

  describe "GET to index" do
    before do
      get :index, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end
  end

  describe "GET to show" do
    before do
      get :show, :id => @user.profile.id, :user_id => @user.id
    end

    it "should work" do
      expect(response).to be_success
    end
  end

end
