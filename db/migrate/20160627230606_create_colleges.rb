class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :city
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
