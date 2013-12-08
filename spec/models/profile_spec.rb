# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  bio        :text
#

require 'spec_helper'

describe Profile do
  it { should belong_to(:user) }
end
