class LikeController < ApiApplicationController
    before_action :set_thought, :auth_request

    def create
        like = Like.find_by(user: Current.user, thought_id: @thought.id)
        
        if like.nil?
            like = Like.create! [{user: Current.user, thought_id: @thought.id}]
        end
        render json: like, status: :created
    end

    def set_thought
        @thought = Thought.find_by!(id: params[:id])
    end
end