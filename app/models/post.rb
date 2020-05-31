class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :gym_name, presence: true
  validates :grade, presence: true
  validates :category, presence: true
  # validates :description, presence: true
  
  belongs_to :user
  has_many :evaluations, dependent: :destroy
  has_many :evaluation_users, through: :evaluations, source: :user
  
  mount_uploader :image, ImageUploader
  # carrierwave設定 Imageuploaderとpostモデルに作成したフィールドimage_pathを関連付ける
end
