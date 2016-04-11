class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :issues
  has_and_belongs_to_many :projects

end
