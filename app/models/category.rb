class Category < ApplicationRecord
    has_many :postcategories, class_name: 'Postcategory'
end
