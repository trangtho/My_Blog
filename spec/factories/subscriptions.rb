FactoryBot.define do
  factory :subscription do
    association :subcriber
    association :subcriber_to
  end
end
