class AuthenticationController < ApiApplicationController
    before_action :auth_request, except: :login

    def login
        Current.user = User.find_by_email(params[:email])
        if Current.user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: Current.user.id)
            time = Time.now + 24.hours.to_i
            render json: {
                token: token,
                exp: time.strftime("%m-%d-%Y %H:%M"),
                email: Current.user.email 
            }, status: :created
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end