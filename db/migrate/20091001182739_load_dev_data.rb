require 'active_record/fixtures'

class LoadDevData < ActiveRecord::Migration
  def self.up
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "rooms")
    Fixtures.create_fixtures(directory, "folks")
    Fixtures.create_fixtures(directory, "messages")
  end

  def self.down
    Message.delete_all
    Folk.delete_all
    Room.delete_all
  end
end
