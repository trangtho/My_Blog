class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', :dependent => :destroy
  has_many_attached :images, :dependent => :destroy
  has_many :postcategories, class_name: 'Postcategory', :dependent => :destroy
  has_many :categories, through: :postcategories

  validates :title, :content, presence: true
  validates :content, length: { minimum: 5 }
end
