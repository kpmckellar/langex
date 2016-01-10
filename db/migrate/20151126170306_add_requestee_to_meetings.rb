class AddRequesteeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :requestee, :integer
  end
end
