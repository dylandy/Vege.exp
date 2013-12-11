class RevertVegetable < ActiveRecord::Migration
  def self.up
    rename_table "vegetables" , "vegetable_logs"

		create_table "vegetables" do |t|
		  t.string "serial"
			t.string "name"
			t.string "r_name"
		end
		add_index "vegetables" , ["serial"] , :name => "vegetable_serial" , :unique => true

		ActiveRecord::Base.connection.execute("INSERT INTO vegetables (serial , name , r_name) (SELECT serial , name , r_name  FROM vegetable_logs GROUP BY serial)")

		add_column "vegetable_logs" , "vegetable_id" , :integer , :null => false

    ActiveRecord::Base.connection.execute("UPDATE vegetable_logs AS vl INNER JOIN vegetables AS v ON vl.serial = v.serial SET vl.vegetable_id = v.id")

		remove_column "vegetable_logs" , "serial"
		remove_column "vegetable_logs" , "name"
		remove_column "vegetable_logs" , "r_name"
  end
	def self.down
		get_error
	end
end
