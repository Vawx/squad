class Project < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  has_many :pending_invites
  has_many :issues
  has_one :user
end
