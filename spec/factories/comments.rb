FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    user { nil }
    thought { nil }
  end
end
