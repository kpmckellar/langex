class CreateJoinTableForUsersTopics < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
      t.references :topic
      t.references :user
    end
  end
end
