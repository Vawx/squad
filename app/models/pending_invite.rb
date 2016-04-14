class PendingInvite < ActiveRecord::Base
  belongs_to :project
  validates :invite_email, presence: true
  validates :invite_email, presence: true
end
