class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :author, presence: true, length: { minimum: 2, maximum: 100 }
  validates :title, uniqueness: { scope: :author, message: "by this author already exists" }
end
