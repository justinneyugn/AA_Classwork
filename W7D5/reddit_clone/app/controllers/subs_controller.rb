class SubsController < ApplicationController
    def new
        @sub = Sub.new
        render :new
    end

    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            render :show
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit 
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :show
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        if @sub.destroy
            redirect_to subs_url
        else
            flash[:errors] = @sub.errors.full_messages
            render :show
        end
    end

    private 
    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
