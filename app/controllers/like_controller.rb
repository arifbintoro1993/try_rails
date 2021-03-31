class LikeController < ApplicationController
    before_action :set_thought

    def create
        like = Like.find_by(user: Current.user, thought_id: @thought.id)
        
        if like.nil?
            like = Like.create! [{user: Current.user, thought_id: @thought.id}]
        end
        redirect_to home_path
    end

    def set_thought
        @thought = Thought.find_by!(id: params[:id])
    end
end