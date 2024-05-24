class API::JazzCafesController < API::BaseController
  def index
    jazz_cafes = JazzCafe.where("name LIKE ?", "%#{ActiveRecord::Base.sanitize_sql_like(params[:query])}%")
    render json: jazz_cafes
  end
end
