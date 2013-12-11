class RenameItemsToVegetables < ActiveRecord::Migration
  
	def self.up
		rename_table "items","vegetables"
  end
	def self.down
		rename_table "vegetables","items"
	end
end
