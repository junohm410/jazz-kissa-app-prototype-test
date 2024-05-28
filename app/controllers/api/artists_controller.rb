class API::ArtistsController < ApplicationController
  def index
    artists = RSpotify::Artist.search(params[:query]).map(&:name)
    render json: artists
  end
end
