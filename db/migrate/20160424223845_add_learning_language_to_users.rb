class AddLearningLanguageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :learning_language, :string
  end
end
