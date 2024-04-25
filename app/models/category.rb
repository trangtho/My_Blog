class Category < ApplicationRecord
  has_many :postcategories, class_name: 'Postcategory', :dependent => :destroy
  has_many :posts, through: :postcategories
  validates :name,
          :presence => {:message => "can't be blank name." },
          :uniqueness => {:message => "already exists."},
          :length => { :maximum => 50, :message => "Must be less than 50 characters"}
end
