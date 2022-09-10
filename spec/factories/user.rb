FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.safe_email }
    username { FFaker::Internet.unique.user_name }
    set_password = FFaker::Internet.password
    password { set_password }
    password_confirmation { set_password }
  end
end
