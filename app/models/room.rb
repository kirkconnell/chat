class Room < ActiveRecord::Base
  has_many :folks
  has_many :messages
end
