class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :validatable, authentication_keys: [:username]
  has_many :posts
  has_many :comments
  has_many :subcribers, class_name: 'Subscription', foreign_key: 'subcriber_id'
  has_many :subcriber_tos, class_name: 'Subscription', foreign_key: 'subcriber_to_id'
  # validates :email, uniqueness: true, message: 'This email already exist'
  # validates :username, uniqueness: true, message: 'This email already exist'
  validates :username, 
          :presence => {:message => "can't be blank." },
          :uniqueness => {:message => "already exists."},
          :length => { :maximum => 100, :message => "Must be less than 20 characters"}
  validates :email, 
          :presence => {:message => "can't be blank." },
          :uniqueness => {:message => "already exists."}


  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
