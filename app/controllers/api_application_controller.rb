class ApiApplicationController < ActionController::API

    def auth_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        begin
            @decode = JsonWebToken.decode(header)
            Current.user = User.find_by(id: @decode[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end
end