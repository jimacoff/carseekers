# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  comment       :text
#  rate          :integer
#  rateable_id   :integer
#  rateable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Rating do
  it { should belong_to(:rateable) }
end
