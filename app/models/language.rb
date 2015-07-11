class Language < ActiveRecord::Base

	has_many :languages_users
	has_many :users, :through => :languages_users

  def mentors
	User.joins(:languages_users).where("languages_users.level > 4 AND languages_users.language_id = #{self.id}")
  end
 
  def mentees
  	User.joins(:languages_users).where("languages_users.level < 5 AND languages_users.language_id = #{self.id}")
  end

end