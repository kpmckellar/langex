class CreateUnis < ActiveRecord::Migration
  def change
    create_table :unis do |t|
      t.string :name
      t.string :city
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
