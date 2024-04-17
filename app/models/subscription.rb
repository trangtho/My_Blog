class Subscription < ApplicationRecord
  belongs_to :subcriber, class_name: 'User'
  belongs_to :subcriber_to, class_name: 'User'
end