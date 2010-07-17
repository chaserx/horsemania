class AddArtistToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.string :artist
      t.string :artist_location
    end
  end

  def self.down
      change_table :locations do |t|
        t.remove :artist, :artist_locaton
      end
  end
end
