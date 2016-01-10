class AddRequestorTopicsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :requestor_topics, :text
  end
end
