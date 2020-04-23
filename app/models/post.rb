class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :gym_name, presence: true
  validates :grade, presence: true
  # validates :description, presence: true
  
  belongs_to :user
end

