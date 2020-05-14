class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :cafeteria
  belongs_to :user
end