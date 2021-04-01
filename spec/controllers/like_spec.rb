require 'rails_helper'

RSpec.describe "Like Thought API", type: :request do
    context "when user is unauthorized" do
        it "then response to unauthorized" do
            thought = create(:thought)
            invalid_token = "less-token"

            post like_path(thought), headers: { "Authorization" => invalid_token }
            expect(response).to be_unauthorized
        end
    end

    context "when user have a valid token" do
        it "then response to created" do
            thought = create(:thought)
            token = JsonWebToken.encode(user_id: thought.user.id)

            post like_path(thought), headers: { "Authorization" => token }
            expect(response).to have_http_status(:created)
            expect(thought.like.count).to eq(1)
        end
    end
end