class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :images, presence: true
  validates :description, length: { maximum: 2200 }

  def liked?(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
