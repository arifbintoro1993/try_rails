class ApplicationController < ActionController::Base
    # make or call function set_current_user the first thing that happend
    # when make a request
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    # make sure users are authenticated
    # if not then redirect to sign in page
    def login_required
        redirect_to sign_in_path if Current.user.nil?
    end
end
