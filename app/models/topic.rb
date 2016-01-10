class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :tags
end
