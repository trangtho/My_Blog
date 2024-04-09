class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :comments, class_name: 'Comment'
    has_many_attached :images
    
    #Sử dụng validates để đảm bảo title và content của Post không rỗng
    validates :title, :content, presence: true
    #Sử dụng validates để đảm bảo content của Post co do dai toi thieu
    validates :content, length: {minimum: 5}
end
