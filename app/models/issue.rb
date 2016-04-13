class Issue < ActiveRecord::Base
  belongs_to :profile
  has_many :comments
  validates :content, presence: true

end
