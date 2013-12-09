require "spec_helper"

describe ApplicationHelper do
  before do
    @user = User.make!
    @gravatar_id = Digest::MD5.hexdigest(@user.email.downcase)
    @size = 200
  end

  it "Should return the correct avatar from Gravatar" do
    gravatar_picture_url(@user, @size).should eq("http://gravatar.com/avatar/#{@gravatar_id}.png?s=#{@size}&d=#{CGI.escape("http://test.host/assets/guest.png")}")
  end
end