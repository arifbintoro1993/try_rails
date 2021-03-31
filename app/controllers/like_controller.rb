class LikeController < ApplicationController
    before_action :set_thought

    def create
        like = Like.find_by!(user: Current.user)
        unless like.present?
            like = Like.new()
        end
    end

    def set_thought
        @thought = Thought.find_by!(id: params[:id])
    end
end