# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  fuel_type  :string(255)
#  age        :string(255)
#  color      :string(255)
#  engine     :string(255)
#  image_url  :string(255)
#  hp         :string(255)
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#  make_id    :integer
#  model_id   :integer
#  style      :string(255)
#

class Car < ActiveRecord::Base
  belongs_to :ad
  belongs_to :make
  belongs_to :model

  #Scoped Attributes
  scope :by_fuel, Proc.new { |fuel_type| where("fuel_type = ?", fuel_type) }
  scope :by_engine, Proc.new { |engine| where("engine = ?", engine) }
  scope :by_age, Proc.new { |age| where("age = ?", age) }
  scope :by_hp, Proc.new { |hp| where("hp = ?", hp) }
  scope :by_style, Proc.new { |style| where("style = ?", style) }
  scope :by_color, Proc.new { |color| where("color = ?", color) }

  #Scoped Relationship
  scope :with_make, Proc.new { |make_id| includes(:make).where(:make_id => make_id) }
  scope :with_model, Proc.new { |model_id| includes(:model).where(:model_id => model_id) }

end
