class Api::SessionsController < ApplicationController
    def create 
        @user = user.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil? 
            flash.now[:errors] = ["invalid username or password!"]
            render :new
        else 
            login!(@user) 
            redirect_to user_url(@user)
        end

    end
end
