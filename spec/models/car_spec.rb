# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  fuel_type  :string(255)
#  age        :string(255)
#  color      :string(255)
#  engine     :string(255)
#  image_url  :string(255)
#  hp         :string(255)
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#  make_id    :integer
#  model_id   :integer
#  style      :string(255)
#

require 'spec_helper'

describe Car do
  context "associations" do
    it { should belong_to(:ad) }
    it { should belong_to(:make) }
  end

  before do
    @car = Car.make!
    @car2 = Car.make!(:v2)
    @car3 = Car.make!
  end

  context "Scoped attributes will filter the results" do
    before do
      @fuel = Car.by_fuel(@car.fuel_type)
      @engine = Car.by_engine(@car.engine)
      @age = Car.by_age(@car.age)
      @hp = Car.by_hp(@car.hp)
      @color = Car.by_color(@car.color)
      @style = Car.by_style(@car.style)
    end

    it "should have find the previous car by different types" do
      @fuel.should eq([@car])
      @engine.should eq([@car])
      @age.should eq([@car])
      @hp.should eq([@car])
      @color.should eq([@car])
      @style.should eq([@car])
    end

    it "should have not finded the car with different values" do
      @fuel.should_not eq(@car2)
      @engine.should_not eq(@car2)
      @age.should_not eq(@car2)
      @hp.should_not eq(@car2)
      @color.should_not eq(@car2)
      @style.should_not eq(@car2)
    end
  end

  context "Scoped relationships will filter through" do
    before do
      @make = Make.make!
      @model = Model.make!
      @car.make = @make
      @car.model = @model
      @car.save!
      @car2.make = @make
      @car2.model = @model
      @car2.save!
      @car3.make = Make.make!(:name => "Seat")
      @car3.model = Model.make!(:name => "Panda")
    end

    it "should have the correct list of cars from the same make" do
      Car.with_make(@make.id).should eq([@car, @car2])
      Car.with_make(@make.id).should_not eq([@car3])
    end

    it "should have the correct list of cars from the same make" do
      Car.with_model(@model.id).should eq([@car, @car2])
      Car.with_model(@model.id).should_not eq([@car3])
    end
  end

end
