class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string  :serial
      t.string  :name
      t.string  :r_name
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.date    :log_date
      t.timestamps
    end
  end
  def self.down
    drop_table :items
  end
end
