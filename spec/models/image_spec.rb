# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#  carphoto   :string(255)
#

require 'spec_helper'

describe Image do
  it { should belong_to(:ad) }
end

