# == Schema Information
#
# Table name: models
#
#  id         :integer          not null, primary key
#  make_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  car_id     :integer
#

require 'spec_helper'

describe Model do
  context "associations" do
    it { should belong_to(:make) }
    it { should have_many(:cars) }
  end
end
