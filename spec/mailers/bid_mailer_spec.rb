require "spec_helper"

describe BidMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = User.make!
    @ad = Ad.make!
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context "Winner email" do
    before do
      BidMailer.winner(@user, @ad).deliver
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

  context "Sold email" do
    before do
      BidMailer.sold(@user, @ad).deliver
    end

    it 'should send an email' do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it 'should set the subject to the correct subject' do
      ActionMailer::Base.deliveries.first.subject.should == "Your Car has been sold!"
    end

    it 'renders the sender email' do
      ActionMailer::Base.deliveries.first.from.should == ['info@carseekers.co.uk']
    end
  end

  context "Unsold email" do
    before do
      BidMailer.unsold(@user, @ad).deliver
    end

    it 'should send an email' do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it 'should set the subject to the correct subject' do
      ActionMailer::Base.deliveries.first.subject.should == "Your Car was not sold..."
    end

    it 'renders the sender email' do
      ActionMailer::Base.deliveries.first.from.should == ['info@carseekers.co.uk']
    end
  end

  context "New bid email" do
    before do
      BidMailer.new_bid(@user, @ad).deliver
    end

    it 'should send an email' do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it 'should set the subject to the correct subject' do
      ActionMailer::Base.deliveries.first.subject.should == "You have set the highest bid"
    end

    it 'renders the sender email' do
      ActionMailer::Base.deliveries.first.from.should == ['info@carseekers.co.uk']
    end
  end

end
