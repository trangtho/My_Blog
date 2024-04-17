class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  validates :content, presence: true
end
