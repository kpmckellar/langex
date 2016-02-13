class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :seeking_proficiency_in, ->(language) { joins(:languages_users).where("level < 5 and language_id = ?", language) }
  scope :proficient_in, ->(language) { joins(:languages_users).where("level > 4 and language_id = ?", language) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :first_name, :last_name, :location, :nationality, :bio
	
  has_many :languages_users
	has_many :languages, :through => :languages_users
  #validates_uniqueness_of :username
  def mailboxer_email(object)
    email
  end

  # def active_for_authentication? 
  #   super && approved? 
  # end 

  # def inactive_message 
  #   if !approved? 
  #     :not_approved 
  #   else 
  #     super # Use whatever other message 
  #   end 
  # end
end
