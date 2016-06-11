class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :tags
  has_and_belongs_to_many :users
end
