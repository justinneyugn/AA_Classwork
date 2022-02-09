class AlbumsController < ApplicationController
    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def new
        if params.has_key?(:band_id)
            @album = Album.new(band_id: params[:band_id])
        else
            @album = Album.new
        end
        render :new
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to "/albums/#{@album.id}"
        else
            flash.now[:errors] = @album.errors.full_messages
        end
    end

    def destroy
        @album = Album.find(params[:id])
        if @album.destroy
            redirect_to albums_url
        else
            flash.now[:errors] = @album.errors.full_messages
        end
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :band_id, :studio?)
    end
end
