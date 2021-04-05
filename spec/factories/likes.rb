FactoryBot.define do
  factory :like do
    thought { create(:thought) }
    user { create(:user) }
  end
end
