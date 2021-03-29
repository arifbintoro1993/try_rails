class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end 

    # create new user
    #
    # if user was saved then
    # set session with user id
    # and redirect to root_path, and create notice message
    #
    # if @user has any errors
    # render to registrations#new
    # and show errors with alert messages
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully Sign Up"
        else
            render :new
        end
    end

    # helper method using private
    # raised an errors if user not present in params
    # and allowed attributes :email, :password :password_confirmation
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end