class Room < ActiveRecord::Base
  has_many :messages , :order => "created_at, id"
  has_many :heart_beats
  has_many :folks, :through => :heart_beats
end
