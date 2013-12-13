require 'spec_helper'

describe Message do
  context "associations" do
    it { should belong_to(:to) }
    it { should belong_to(:from) }
    it { should belong_to(:reply) }
  end
end
