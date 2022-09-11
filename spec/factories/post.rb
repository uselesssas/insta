FactoryBot.define do
  factory :post do
    association :user

    images { [Pathname.new("spec/assets/1080x1080.png").open] }
    description { FFaker::Tweet.tweet }
  end
end
