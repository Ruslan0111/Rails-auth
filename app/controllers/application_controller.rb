class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def authorize_request
    header = request.headers['Authorization']

    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded["user_id"])
    rescue JWT::DecodeError => e
      render json: { message: "Unauthorized", data: e.message }, status: :unauthorized
    end

  end

  private
    def not_found
      render json: { message: "Not found" }, status: :not_found
    end
end
