class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
end
