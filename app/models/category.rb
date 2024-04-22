class Category < ApplicationRecord
  has_many :postcategories, class_name: 'Postcategory'

  validates :name,
          :presence => {:message => "can't be blank." },
          :uniqueness => {:message => "already exists."},
          :length => { :maximum => 20, :message => "Must be less than 20 characters"}
end
