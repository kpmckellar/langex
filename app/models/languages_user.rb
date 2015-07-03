class LanguagesUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :language

	validates_presence_of :user_id, :language_id, :level
	#on: :create
end