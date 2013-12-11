class BuildVegetableLogLog < ActiveRecord::Migration
  def self.up
    create_table "vegetable_stats" do |t|
		    t.integer :vegetable_id , :null => false
		    t.integer :kind       , :limit => 1 , :default => 0 , :null => false
            t.date    :log_date   , :null => false
            t.integer :avg_price1 , :default => 0 , :null => false
			t.integer :avg_price2 , :default => 0 , :null => false
			t.integer :avg_price3 , :default => 0 , :null => false
			t.integer :max_price1 , :default => 0 , :null => false
			t.integer :max_price2 , :default => 0 , :null => false
			t.integer :max_price3 , :default => 0 , :null => false
			t.integer :min_price1 , :default => 0 , :null => false
			t.integer :min_price2 , :default => 0 , :null => false
			t.integer :min_price3 , :default => 0 , :null => false
		end
		add_index "vegetable_stats" , ["kind"] , :name => "vegetable_stats_kind"
		add_index "vegetable_stats" , ["log_date"] , :name => "vegetable_stats_log_date"
    add_index "vegetable_stats" , ["vegetable_id" , "kind" , "log_date"] , :name => "vegetable_stats_vegetable_id_kind_log_date" , :unique => true

  end
	def self.down
	  drop_table "vegetable_stats"
	end
end
