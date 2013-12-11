class AddVegetableKind < ActiveRecord::Migration
  def self.up
	  add_column :vegetables , :season , :integer , :limit => 1
		add_column :vegetables , :kind   , :integer , :limit => 1
		add_column :vegetables , :form   , :integer , :limit => 2
  end
	def self.down
	  remove_column :vegetables , :season
		remove_column :vegetables , :kind
		remove_column :vegetables , :form
	end
end
