class Message < ActiveRecord::Base
  belongs_to :room
  belongs_to :folk
  
  def self.find_latest(room_id, folk_id)
    transaction do
      beat = HeartBeat.find  :first, :conditions => ["room_id = ? and folk_id = ?", room_id, folk_id],
                              :order => "created_at desc"
      unless beat.nil?
        new_messages = Message.all :conditions => ["room_id = ? and created_at > ?", room_id, beat.updated_at],
                                   :order => "created_at"
        beat.touch unless new_messages.empty?
        new_messages
      end
    end
  end
  
end
