class VegetableAddIsHidden < ActiveRecord::Migration
  def self.up
    add_column :vegetables , :is_hidden , :boolean , :default => false , :null => false
  end
  def self.down
    remove_column :vegetables , :is_hidden
  end
end
