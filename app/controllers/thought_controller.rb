class ThoughtController < ApplicationController
    before_action :login_required

    def index
        @thoughts = Thought.where({"user" => Current.user}).order(created_at: :desc)
    end

    def create
        thought = Thought.new(idea: params[:idea], user: Current.user)
        if thought.save
            redirect_to home_path
        end
    end
end