FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.safe_email }
    username { FFaker::Internet.unique.user_name }
    password = FFaker::Internet.password
    password { password }
    password_confirmation { password }
  end
end
