FactoryBot.define do
  factory :post do
    association :user

    images { [FFaker::Image.file('1000x1000')] }
    description { FFaker::Tweet.tweet }
  end
end
