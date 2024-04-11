class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :comments, class_name: 'Comment'
    has_many_attached :images
    
    validates :title, :content, presence: true
    validates :content, length: {minimum: 5}
end
