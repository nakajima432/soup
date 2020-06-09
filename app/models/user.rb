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
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  validates :username, :email, presence: true
  
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

  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end



