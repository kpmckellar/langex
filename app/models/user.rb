class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :seeking_proficiency_in, ->(language) { joins(:languages_users).where("level < 5 and language_id = ?", language) }
  scope :proficient_in, ->(language) { joins(:languages_users).where("level > 4 and language_id = ?", language) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role



  acts_as_messageable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :first_name, :last_name, :location, :nationality, :bio

	
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "user" if self.role.nil?
  end

  has_many :languages_users
	has_many :languages, :through => :languages_users
  accepts_nested_attributes_for :languages_users
  #validates_uniqueness_of :username
  def mailboxer_email(object)
    email
  end


  # ROLES = {0 => :guest, 1 => :user, 2 => :moderator, 3 => :admin}

  # attr_reader :role

  # def initialize(role_id = 0)
  #   @role = ROLES.has_key?(role_id.to_i) ? ROLES[role_id.to_i] : ROLES[0]
  # end

  # def role?(role_name)
  #   role == role_name
  # end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
