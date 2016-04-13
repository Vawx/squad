class Project < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :profiles
  has_many :pending_invites
  has_many :issues
  has_one :user
end
