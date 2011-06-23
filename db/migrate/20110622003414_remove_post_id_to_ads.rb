class RemovePostIdToAds < ActiveRecord::Migration
  def self.up
    remove_column :ads, :post_id
  end

  def self.down
    add_column :ads, :post_id, :integer
  end
end
