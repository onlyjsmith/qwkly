class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :site_id
      t.string :term

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
