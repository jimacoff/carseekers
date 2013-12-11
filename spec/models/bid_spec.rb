# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ad_id         :integer
#  buy_now_price :float
#  created_at    :datetime
#  updated_at    :datetime
#  actual        :float
#  highest       :float
#

require 'spec_helper'

describe Bid do
  context "associations" do
    it { should belong_to(:ad) }
    it { should belong_to(:user) }
  end
end
