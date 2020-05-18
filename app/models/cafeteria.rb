class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Cafeteria.where(['addres LIKE(?) OR detail LIKE (?) OR name LIKE (?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Cafeteria.all
    end
  end

  def self.create_all_ranks
    Cafeteria.joins(:likes).group(:cafeteria_id).order('count(cafeteria_id) desc')
  end

end