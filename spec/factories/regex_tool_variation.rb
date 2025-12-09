FactoryBot.define do
  factory :regex_tool_variation do
    association :regex_tool
    key { "#{Faker::Lorem.word}_#{rand(1000)}" }
    label { Faker::Lorem.word }
    pattern { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
