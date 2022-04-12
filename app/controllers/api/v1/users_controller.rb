class Api::V1::UsersController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)

      render json: { message: "User created", token: token }, status: :created
    else
      render json: { message: "User not created", data: user.errors }, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.permit([:email, :password])
    end
end
