class LanguagesUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :language

	validates_presence_of :user_id, :language_id, :level
	#on: :create


	#LEVEL = [{"name"=>"New", "level"=>1}, {"name"=>"Beginner", "level"=>2}, {"name"=>"Intermediate", "level"=>3}, {"name"=>"Advanced", "level"=>4}, {"name"=>"Fluent", "level"=>5}]
end