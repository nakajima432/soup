class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
  # attachment :image
end
