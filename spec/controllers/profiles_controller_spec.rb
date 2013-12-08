require 'spec_helper'

describe ProfilesController do

  before do
    @user = User.make!
    @profile = @user.profile
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

  describe "Patch to update" do
    before do
      @previous_bio = "I don't like cars"
      @new_bio = "I like cars"

      @profile = @user.profile
      @profile.bio = @previous_bio
      @profile.save!

      @valid_params = { :profile => {
        :bio => @new_bio
      }}

      patch :update, @valid_params.merge(:user_id => @user.id, :id => @user.profile.id)
    end

    it "should have stored the information" do
      @profile.reload
      @profile.bio.should eq(@new_bio)
      @profile.bio.should_not eq(@previous_bio)
    end
  end

end
