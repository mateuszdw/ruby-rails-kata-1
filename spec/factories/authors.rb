FactoryBot.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :author do
    email
    firstname { "John" }
    lastname  { "Doe" }
  end
end
