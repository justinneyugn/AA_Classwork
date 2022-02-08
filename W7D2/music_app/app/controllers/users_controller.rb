class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :requre_logged_in, only: [:index, :show]
  
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
      redirect_to user_url(@user)
    else
      flash.now[:errors]  = @user.errors.full_messages
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect to "/users/#{@user.id}"
    else
      flash.now[:errors]  = @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_url
    else
      flash.now[:errors]  = @user.errors.full_messages
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
