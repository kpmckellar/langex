class CreateLanguagesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :languages_users do |t|
      t.references :language
      t.references :user
      t.integer :level
      t.boolean :matching

      t.timestamps null: false
    end
  end
end
