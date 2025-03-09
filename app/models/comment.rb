class Comment < ApplicationRecord
  belongs_to :board

  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
