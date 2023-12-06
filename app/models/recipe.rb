class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
end
