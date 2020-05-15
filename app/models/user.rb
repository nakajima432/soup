class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # mount_uploader :profile_image_id, ImageUploader
  attachment :profile_image
  has_many :cafeterias
  has_many :likes, dependent: :destroy
  has_many :liked_cafeterias, through: :likes, source: :cafeteria
  validates :username, presence: true
end
