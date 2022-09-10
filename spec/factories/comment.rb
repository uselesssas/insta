FactoryBot.define do
  factory :comment do
    association :user
    association :post

    body { FFaker::Tweet.body }
  end
end
