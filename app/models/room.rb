class Room < ActiveRecord::Base
  has_many :messages , :order => "created_at, id"
  has_many :heart_beats
  has_many :folks, :through => :heart_beats
  has_many :online_folks, :through => :heart_beats, :source => :folk,
           :conditions => ["heart_beats.updated_at > ?", 1.minute.ago]
           
  def online_folks_ids
    online_folks.collect { |folk| folk.id }
  end
  
end
