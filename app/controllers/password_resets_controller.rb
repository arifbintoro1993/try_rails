class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            # send mail
            # deliver_later -> send email using background job
            # deliver_now -> send email rigth away and send a response in rails app browser slower
            # because it has to wait email is actually sent
            PasswordMailer.with(user: @user).reset.deliver_now
            redirect_to root_path, notice: "We have sent a link to your email for reset your password."
        else
            flash[:alert] = "The e-mail address is not assigned to any user account"
            render :new
        end
    end
end