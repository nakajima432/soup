class Cafeteria < ApplicationRecord
  validates :name, :addres, :detail, presence: true
  # belongs_to :user
end
