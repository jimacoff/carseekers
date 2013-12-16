# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  description    :text
#  starting_price :float
#  buy_now_price  :float
#  ends           :date
#  active         :boolean
#  mailed         :boolean
#

class Ad < ActiveRecord::Base

  #Associations
  belongs_to :user
  has_many :images
  has_one :car
  has_many :bids
  has_many :messages

  scope :active, Proc.new { where("ends > ?", Time.now) }
  scope :expired, Proc.new { where("ends < ?", Time.now) }
  scope :finished, Proc.new { where("ends < ? AND mailed = false", Time.now) }

  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :car, :allow_destroy => true

  #Geocoder
  geocoded_by :address

  #Callbacks
  after_validation :geocode
  before_save :set_bid
  after_save :images_holder

  def self.mail_to
    finished = self.finished
    finished.map do |ad|
      ad.mailed = true
      ad.save!
      if ad.top_bid > 0
        BidMailer.winner(ad.user, ad).deliver
        BidMailer.sold(ad.user, ad).deliver
      else
        BidMailer.unsold(ad.user, ad).deliver
      end
    end
  end

  def active?
    self.created_at < self.ends
  end

  def set_bid
    unless self.top_bid
      bid = Bid.new
      bid.highest = self.starting_price
      bid.save
      self.bids << bid
    end
  end

  def images_holder
    images_quantity = self.images.count
    if images_quantity < 5
      images_needed = 5 - images_quantity
      images_needed.times do
        self.images << Image.new
      end
    end
  end

  def top_bid
    Bid.where('ad_id = ? ', self.id).maximum(:highest)
  end
end
