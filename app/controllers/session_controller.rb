class SessionController < ApplicationController
    def new
    end

    # perform sign up
    # find user by email, if it's present and authenticated using params[:password] then,
    # set session[:user_id] to user.id and redirect to root path
    # if user not present or user not authenticated
    # render to new function
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Successfuly sign in"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end


    # logout function
    # set session[:user_id] to nil
    # and redirect to root_path
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged Out"
    end
end