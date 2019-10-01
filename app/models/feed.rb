class Feed < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  validates :title, :content, presence: true
end
