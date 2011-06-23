class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.integer :post_id
      t.string :email
      t.text :content
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
	add_index :ads, :user_id
	add_index :ads, :created_at
	add_index :ads, :category_id
  end

  def self.down
    drop_table :ads
  end
end
