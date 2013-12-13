# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  content    :text
#  to_id      :integer
#  from_id    :integer
#  reply_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  belongs_to :to, :class_name => "User", :foreign_key => "to_id"
  belongs_to :from, :class_name => "User", :foreign_key => "from_id"
  belongs_to :reply, :class_name => "Message", :foreign_key => "reply_id"
  belongs_to :ad
end
