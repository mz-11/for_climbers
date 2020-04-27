class UserProfile < ApplicationRecord
  validates :user_id, presence: true
 
  belongs_to :user
end
