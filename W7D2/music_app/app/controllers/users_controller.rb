class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to 
    end
  end

  def update
  end

  def destroy
  end
end
