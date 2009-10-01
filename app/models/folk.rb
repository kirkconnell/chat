class Folk < ActiveRecord::Base
  belongs_to :room
  has_many :messages
end
