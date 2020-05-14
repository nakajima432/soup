class Comment < ApplicationRecord
  belongs_to :cafeteria
  belongs_to :user
end