FactoryBot.define do
    factory :post do
      title { 'Monday' }
      content { 'Start week 4' }
      association :user
    end
end