require "spec_helper"

describe BidMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = User.make!
    @ad = Ad.make!
    BidMailer.winner(@user, @ad).deliver
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'should set the subject to the correct subject' do
    ActionMailer::Base.deliveries.first.subject.should == "Congratulations! You have won the auction #{@ad.title}"
  end

  it 'renders the sender email' do
    ActionMailer::Base.deliveries.first.from.should == ['info@carseekers.co.uk']
  end

end
