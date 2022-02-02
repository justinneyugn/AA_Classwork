class UsersController < ApplicationController
    def index 
        users = User.all
        render json: :users
    end

    def show
        user = User.find(params[:id])
        render json: :user
    end

    def edit
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}/edit"
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def new
        
    end
end
