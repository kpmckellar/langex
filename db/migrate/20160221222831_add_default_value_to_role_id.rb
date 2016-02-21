class AddDefaultValueToRoleId < ActiveRecord::Migration
  def change
  	def up
  		change_column :users, :role_id, :integer, :default => 1
	end

	def down
	  change_column :profiles, :role_id, :integer, :default => nil
	end
  end
end
