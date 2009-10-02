class CreateTimestamps < ActiveRecord::Migration
  def self.up
    create_table :timestamps do |t|
      t.integer :room_id
      t.integer :folk_id
      t.timestamps
    end
  end

  def self.down
    drop_table :timestamps
  end
end
