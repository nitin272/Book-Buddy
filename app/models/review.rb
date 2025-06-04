class Review < ApplicationRecord
  belongs_to :book

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 5, maximum: 500 }
end
