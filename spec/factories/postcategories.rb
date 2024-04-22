FactoryBot.define do
  factory :postcategory do
    association :category
    association :post
  end
end
