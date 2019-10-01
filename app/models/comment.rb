class Comment < ApplicationRecord
  belongs_to :feed
  belongs_to :user
  validates :content, presence: true
end
