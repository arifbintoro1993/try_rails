FactoryBot.define do
    factory :thought do
        idea {"this is idea"}
        user { create(:user) }
    end
end