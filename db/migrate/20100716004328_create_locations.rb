class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :title
      t.text :desc
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end
  
  def self.down
    drop_table :locations
  end
end
