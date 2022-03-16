class Api::SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user.nil?
            flash.now[:errors] = ['Invalid username or password.']
        else
        # Log them in and redirect them if we find them
            login!(@user)
            render :show
        end
    end

    def destroy
        logout!
    end
end
