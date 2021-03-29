class MainController < ApplicationController
    def index
        # if session[:user_id] present
        # find user and set @user
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end