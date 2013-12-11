# == Schema Information
#
# Table name: makes
#
#  id         :integer          not null, primary key
#  car_id     :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Make do
  context "associations" do
    it { should have_many(:models) }
    it { should have_many(:cars) }
  end

  context "it should get the data from edmunds" do
    before do
      file = JSON[File.read("cardata.json")]
      Edmunds::Make.any_instance.stubs(:find_all).returns file
      Make.get_data
    end

    it "should have the data for all the makes" do
      Make.first.name.should eq("AM General")
    end

    it "should have the information for all the models" do
      Make.first.models.first.name.should eq("Hummer")
    end
  end
end
