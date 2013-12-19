require 'spec_helper'

describe SearchesController do

  before do
    @ad = Ad.make!(:complete)
  end

  context "create the rate for the correct rateable model" do
    before do

      @valid_params = { :search => {
        :make_id => @ad.car.make.id,
        :model_id => @ad.car.model.id,
        :color => "Red",
        :fuel_type => "",
        :engine => "",
        :age => "",
        :hp => "",
        :style => "",
        :color => ""
      }}

      post :index, @valid_params
    end

    it "should have the correct rating" do
      assigns(:results).first.car.model.name.should eq(@ad.car.model.name)
    end
  end

end
