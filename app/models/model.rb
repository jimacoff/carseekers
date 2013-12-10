# == Schema Information
#
# Table name: models
#
#  id         :integer          not null, primary key
#  make_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Model < ActiveRecord::Base
  belongs_to :make

end
