class User < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def password_required?
    new_record? || password.present?
  end
end
