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

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        #
        # redirect if token has expired
        redirect_to sign_in_path, alert: "Your token has expired, Please try again."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
        else
            render :edit
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end