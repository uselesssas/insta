class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, length: { in: 3..25 }, uniqueness: { case_sensitive: false }
  # First character must be a letter
  # Contains latin letters, numbers and signs('-' '.' '_')
  validates :username, format: { with: /\A[a-zA-Z][a-zA-Z0-9_.\-]+\z/, message: 'error message' }
end
