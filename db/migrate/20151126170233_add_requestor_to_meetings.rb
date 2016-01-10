class AddRequestorToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :requestor, :integer
  end
end
