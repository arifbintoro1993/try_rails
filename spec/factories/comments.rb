FactoryBot.define do
  factory :comment do
    comment { "This is my comment" }
    user { create(:user) }
    thought { create(:thought) }
  end
end
