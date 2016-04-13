class Comment < ActiveRecord::Base
  belongs_to :issue
  validates :content, presence: true
  validates :author_id, presence: true
end
