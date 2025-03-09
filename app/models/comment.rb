class Comment < ApplicationRecord
  belongs_to :board

  validates :content, presence: true
end
