class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :cafeterias
  has_many :likes, dependent: :destroy
  has_many :liked_cafeterias, through: :likes, source: :cafeteria
  has_many :comments
  validates :username, :email, presence: true
  
  # ブックカフェアプリ
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships

  def follow(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
  
  def already_liked?(cafeteria)
    self.likes.exists?(cafeteria_id: cafeteria.id)
  end
end



