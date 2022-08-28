class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user

  validates :images, presence: true
end
