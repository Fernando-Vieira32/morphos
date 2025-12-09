FactoryBot.define do
  factory :regex_tool do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
