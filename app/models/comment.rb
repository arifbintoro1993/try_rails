class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :thought

  validates :comment, presence: true
end
