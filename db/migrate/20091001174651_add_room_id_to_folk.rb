class AddRoomIdToFolk < ActiveRecord::Migration
  def self.up
    add_column :folks, :room_id, :integer
  end

  def self.down
    remove_column :folks, :room_id
  end
end
