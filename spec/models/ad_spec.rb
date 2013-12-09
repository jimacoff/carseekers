require 'spec_helper'

describe Ad do
  it { should belong_to(:user) }
  it { should have_many(:images) }
end
