class RenameTimestampToTimeStamp < ActiveRecord::Migration
  def self.up
    rename_table :timestamps, :heart_beats
  end

  def self.down
    rename_table :heart_beats, :timestamps
  end
end
