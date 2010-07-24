class RemovePhotoIdFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :photo_id
  end

  def self.down
    add_column :users, :photo_id, :integer
  end
end
