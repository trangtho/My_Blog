class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]
    has_many :posts
    has_many :comments
    has_many :subcribers, class_name: "Subscription", foreign_key: 'subcriber_id'
    has_many :subcriber_tos, class_name: "Subscription", foreign_key: 'subcriber_to_id'

    def email_required?
      false 
    end   

    def will_save_change_to_email?
    end
end