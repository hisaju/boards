class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
