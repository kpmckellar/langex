class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :requestor_id
      t.integer :requestee_id
      t.datetime :meeting_time
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
