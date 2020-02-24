class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 100 }
end
