class AddSponsorToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :sponsor, :string
  end

  def self.down
    remove_column :locations, :sponsor
  end
end
