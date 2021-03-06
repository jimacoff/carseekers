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
#  latitude       :float
#  longitude      :float
#  postcode       :string(255)
#  city           :string(255)
#

class Ad < ActiveRecord::Base

  #Associations
  belongs_to :user
  has_many :images
  has_one :car
  has_many :bids
  has_many :messages
  has_one :rating, :as => :rateable
  belongs_to :winner, :class_name => "User", :foreign_key => "winner_id"

  #Scope for itself
  scope :active, Proc.new { where("ends > ?", Time.now) }
  scope :expired, Proc.new { where("ends < ?", Time.now) }
  scope :finished, Proc.new { where("ends < ? AND mailed = false", Time.now) }

  #Scope Car Atributes
  scope :by_fuel, Proc.new { |fuel_type| joins(:car).where("fuel_type = ?", fuel_type) }
  scope :by_engine, Proc.new { |engine| joins(:car).where("engine = ?", engine) }
  scope :by_age, Proc.new { |age| joins(:car).where("age = ?", age) }
  scope :by_hp, Proc.new { |hp| joins(:car).where("hp = ?", hp) }
  scope :by_style, Proc.new { |style| joins(:car).where("style = ?", style) }
  scope :by_color, Proc.new { |color| joins(:car).where("color = ?", color) }

  #Scope Car Relationships
  scope :with_make, Proc.new { |make_id| joins(:car => :make).where("cars.make_id" => make_id) }
  scope :with_model, Proc.new { |model_id| joins(:car => :model).where("cars.model_id" => model_id) }

  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :car, :allow_destroy => true

  #Geocoder
  geocoded_by :location

  #Callbacks
  before_save :set_bid
  after_save :images_holder
  after_validation :geocode

  #Mail sender (recommended to run with clockwork)
  def self.mail_to
    finished = self.finished
    finished.map do |ad|
      ad.mailed = true
      ad.save!
      if ad.sold?
        ad.winner_id = ad.top_bidder.id
        ad.save!
        BidMailer.winner(ad.top_bidder, ad).deliver
        BidMailer.sold(ad.user, ad).deliver
      else
        BidMailer.unsold(ad.user, ad).deliver
      end
    end
  end

  def active?
    self.created_at < self.ends
  end

  #Sets the starting bid on the ad
  def set_bid
    unless self.top_bid
      bid = Bid.new
      bid.user_id = self.user.id
      bid.highest = self.starting_price
      bid.save
      self.bids << bid
    end
  end

  #Sets the file uploader to allow upload 5 images
  def images_holder
    images_quantity = self.images.count
    if images_quantity < 5
      images_needed = 5 - images_quantity
      images_needed.times do
        self.images << Image.new
      end
    end
  end

  #Returns the object of the User that has the highest bid on that particular ad object
  def top_bidder
    User.find(self.bids.find_by_highest(self.top_bid).user_id)
  end

  #Returns the !amount! of the highest bid on the ad
  def top_bid
    Bid.where('ad_id = ? ', self.id).maximum(:highest)
  end

  def has_bid?
    self.top_bidder != self.user && self.top_bid > self.starting_price
  end

  def sold?
    !self.active? && self.has_bid?
  end

  private
  def location
    "#{postcode} #{city}"
  end

end
