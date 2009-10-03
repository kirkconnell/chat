class Folk < ActiveRecord::Base
  has_many :messages
  has_many :heart_beats
  has_many :rooms, :through => :heart_beats
  
  validates_presence_of :name
end
