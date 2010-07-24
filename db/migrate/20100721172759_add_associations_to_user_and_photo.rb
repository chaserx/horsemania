class AddAssociationsToUserAndPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :user_id, :integer
    add_column :users, :photo_id, :integer
  end

  def self.down
    remove_column :photos, :user_id
    remove_column :users, :photo_id
  end
end
