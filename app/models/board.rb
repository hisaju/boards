class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "title", "updated_at"]
  end
end
