class CreateCatalogs < ActiveRecord::Migration
  def up
    create_table :catalogs do |t|
      t.string :name
      t.integer :kind , :limit => 1 , :defualt => 0 , :null => false

      t.timestamps
    end
  end
  def down
    drop_table :catalogs
  end
end
