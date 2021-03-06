class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
