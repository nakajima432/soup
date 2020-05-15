class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Cafeteria.where(['addres LIKE(?) OR detail LIKE (?) OR name LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Cafeteria.all
    end
  end
end