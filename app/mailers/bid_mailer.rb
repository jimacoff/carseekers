class BidMailer < ActionMailer::Base
  default from: "info@carseekers.co.uk"

  def new_bid(user, ad)
    @user = user
    @ad = ad
    mail(to: @user.email, subject: 'You have set the highest bid')
  end

  def winner(user, ad)
    @user = user
    @ad = ad
    mail(to: @user.email, subject: "Congratulations! You have won the auction #{@ad.title}")
  end

  def sold(user, ad)
    @user = user
    @ad = ad
    mail(to: @user.email, subject: "Your Car has been sold!")
  end

  def unsold(user, ad)
    @user = user
    @ad = ad
    mail(to: @user.email, subject: "Your Car was not sold...")
  end

end