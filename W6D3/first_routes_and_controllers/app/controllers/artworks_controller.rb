class ArtworksController < ApplicationController
  def index 
    artworks = Artwork.find(params[:user_id])
  
    render json: artworks.artworks
    # , user.shared_artworks
    # render plain: "I'm in the Index Action. Success"
  end

  # protected
  # def artwork_params
  #   self.params[:artworks].permit(:artist_id)
  # end
end
