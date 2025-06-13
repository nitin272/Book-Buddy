class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :user, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :with_reviews, -> { includes(:reviews) }
end
