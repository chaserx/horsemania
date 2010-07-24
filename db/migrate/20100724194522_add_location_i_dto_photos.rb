class AddLocationIDtoPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :location_id, :integer
  end

  def self.down
    remove_column :photos, :location_id
  end
end
