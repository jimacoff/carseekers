class Message < ActiveRecord::Base
  belongs_to :to, :class_name => "User", :foreign_key => "to_id"
  belongs_to :from, :class_name => "User", :foreign_key => "from_id"
  belongs_to :reply, :class_name => "Message", :foreign_key => "reply_id"
end
