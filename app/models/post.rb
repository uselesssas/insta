class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :images, presence: true
end
