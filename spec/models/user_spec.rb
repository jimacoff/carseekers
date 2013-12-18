# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  picture_url            :string(255)
#  google_token           :string(255)
#  google_id              :string(255)
#  nick                   :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'spec_helper'

describe User do
  context "associations" do
    it { should have_one(:profile) }
    it { should have_many(:ads) }
    it { should have_many(:bids) }
    it { should have_many(:received_messages) }
    it { should have_many(:sent_messages) }
    it { should have_many(:wins) }
  end

  context "creates a profile" do
    before do
      @user = User.make!
    end

    it "automatically creates a profile on creation" do
      assert(@user.profile)
    end
  end
end
