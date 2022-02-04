class ArtworksController < ApplicationController
  def index 
    artworks = Artwork.where(artist_id: params[:user_id])
    user = Artwork_Share.where(viewer_id: params[:user_id])
    # artworks_shared = Artwork.where(id: params[:viewer_id])

    render json: user
    # , user.shared_artworks
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