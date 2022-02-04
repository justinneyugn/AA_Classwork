class ArtworksController < ApplicationController
  def index 
    artworks = Artwork.where(artist_id: params[:user_id])

    shared_artwork = User.find(params[:user_id]).shared_artworks
    render_art = [artworks, shared_artwork]

    render json: render_art
  end

end



# class AppointmentSerializer
#   include FastJsonapi::ObjectSerializer
#   belongs_to :doctor
#   belongs_to :patient
# end

# def show
#   appointment = Appointment.find(params[:id])
#   options = {
#     include: [:doctor, :patient]
#   }
#   render json: AppointmentSerializer.new(appointment, options)
# end