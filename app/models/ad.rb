# == Schema Information
#
# Table name: ads
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Ad < ActiveRecord::Base

  #Associations
  belongs_to :user
  has_many :images
  has_one :car
  has_many :bids

  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :car, :allow_destroy => true

  #Callbacks
  before_save :set_bid
  after_save :images_holder

  def set_bid
    bid = Bid.new
    bid.highest = self.starting_price
    bid.save
    self.bids << bid
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
end
