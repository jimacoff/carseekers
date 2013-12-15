# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  content    :text
#  to_id      :integer
#  from_id    :integer
#  reply_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#

require 'spec_helper'

describe Message do
  context "associations" do
    it { should belong_to(:to) }
    it { should belong_to(:from) }
    it { should belong_to(:reply) }
  end
end
