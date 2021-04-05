require 'rails_helper'

RSpec.describe "Auth API using JWT", type: :request do
    context "when post request without headers auth" do
        it "then response to unauthorized" do
            post api_auth_path
            
            expect(response).to be_unauthorized
        end
    end

    context "when post request succed" do
        it "then get token from JWT" do
            user = create(:user)
            token = JsonWebToken.encode(user_id: user.id)
            headers = { "CONTENT_TYPE" => "application/json" }
            params = {:email => user.email, :password => user.password}

            post api_auth_path, :params => params.to_json, :headers => headers
            expect(response).to have_http_status(:created)
            expect(response.content_type).to eq("application/json; charset=utf-8")
            response_json = JSON.parse(response.body)
            expect(response_json["token"]).to eq(token)
        end
    end
end