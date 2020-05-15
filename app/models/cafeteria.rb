class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader
  attachment :profile_image
end
