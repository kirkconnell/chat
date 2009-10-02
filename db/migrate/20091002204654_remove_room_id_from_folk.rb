class RemoveRoomIdFromFolk < ActiveRecord::Migration
  def self.up
    remove_column :folks, :room_id
  end

  def self.down
    add_column :folks, :room_id, :integer
  end
end
