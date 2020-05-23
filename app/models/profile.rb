class Profile < ApplicationRecord
  validates :user_id, presence: true
  # validates :height, presence: true
 
  belongs_to :user
  
  mount_uploader :profile_image, ImageUploader
end
