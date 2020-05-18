class Like < ApplicationRecord
  belongs_to :user
  belongs_to :cafeteria
  validates_uniqueness_of :cafeteria_id, scope: :user_id
end