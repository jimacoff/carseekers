require 'spec_helper'

describe Bid do
  context "associations" do
    it { should belong_to(:ad) }
    it { should belong_to(:user) }
  end
end
