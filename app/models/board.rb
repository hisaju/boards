class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
end
