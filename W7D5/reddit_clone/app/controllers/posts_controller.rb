class PostsController < ApplicationController
    before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]

    def new
        @post = Post.new
        render :new
    end

    def index
        # debugger
        @posts = Post.where(sub_id: params[:sub_id])
        render :index
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            render :show
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit 
        if params[:author_id] == current_user.id
            @post = Post.find(params[:id])
            render :edit
        end
    end

    def update
        if params[:author_id] == current_user.id
            @post = Post.find(params[:id])
            if @post.update(post_params)
                redirect_to post_url(@post)
            else
                flash[:errors] = @post.errors.full_messages
                render :show
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_url
        else
            flash[:errors] = @post.errors.full_messages
            render :show
        end
    end

    private 
    def post_params
        params.require(:sub).permit(:title, :url, :content, sub_id: [], :author_id)
    end
end
