class AddIpToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :ip, :string
  end

  def self.down
    remove_column :requests, :ip
  end
end
