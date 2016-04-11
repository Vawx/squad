class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :bugs
  has_many :tasks
  has_and_belongs_to_many :projects

end
