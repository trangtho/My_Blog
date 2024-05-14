FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username#{n}"}
    sequence(:email) {|n| "abc#{n}@gmail.com"}
    password { '123456' }
    role { 'User' }
    sequence(:jti) {|n| "jti#{n}"}
  end
end
