class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.datetime :date
      t.string :title
      t.text :article

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
