class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }
  has_many :comments
  belongs_to :user
end
