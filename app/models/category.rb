class Category < ApplicationRecord
  has_many :postcategories, class_name: 'Postcategory'

  validates :name, presence: true
end
