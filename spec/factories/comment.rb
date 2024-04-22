FactoryBot.define do
  factory :comment do
    content { 'nice' }
    association :user
    association :post
  end
end
