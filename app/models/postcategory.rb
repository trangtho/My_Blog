class Postcategory < ApplicationRecord
    belongs_to :post, class_name: 'Post'
    belongs_to :category, class_name: 'Category'
end
