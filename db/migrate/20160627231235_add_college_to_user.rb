class AddCollegeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :college, index: true, foreign_key: true
  end
end
