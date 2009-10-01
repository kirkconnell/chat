class Message < ActiveRecord::Base
  belongs_to :room
  belongs_to :folk
end
