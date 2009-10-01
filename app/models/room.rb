class Room < ActiveRecord::Base
  has_many :folks
  has_many :messages , :order => "created_at, id"
end
