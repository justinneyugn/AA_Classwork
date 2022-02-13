class GoalsController < ApplicationController
    before_action :require_logged_in
    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = current_user.id
        if @goal.save
            redirect_to user_url(params[:user_id])
        else
            flash[:errors] = @goal.errors.full_messages
            redirect_to user_url(params[:user_id])
        end
    end

    def destroy
        @goal = current_user.goals.find_by(id: params[:id])
        if @goal && @goal.destroy
            redirect_to users_url
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
