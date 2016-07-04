class CreateWaitlistRequests < ActiveRecord::Migration
  def change
    create_table :waitlist_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :native_language
      t.integer :learning_language
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
