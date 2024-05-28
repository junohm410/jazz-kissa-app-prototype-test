class API::RecordsController < API::BaseController
  def index
    records = RSpotify::Album.search(params[:query]).map(&:name)
    render json: records
  end
end
