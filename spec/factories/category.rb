FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category#{n}" }
  end
  # factory :category do |f|
  #   f.name { Faker::Name.name }
  # end
  # factory :invalid_category, parent: :category do |f|
  #   f.name nil
  # end
end
