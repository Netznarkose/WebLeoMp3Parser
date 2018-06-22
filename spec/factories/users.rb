FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    after(:build) do |user|
      user.password_confirmation = user.password = 'password'
    end
  end
end
