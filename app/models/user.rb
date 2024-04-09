class User < ApplicationRecord
    has_many :posts#, class_name: "Post", foreign_key: 'user_id'
    has_many :comments
    has_many :subcribers, class_name: "Subscription", foreign_key: 'subcriber_id'
    has_many :subcriber_tos, class_name: "Subscription", foreign_key: 'subcriber_to_id'

    # validates :username, password: true
    # validates :password, presence: true, length: { minimum: 5 }
end