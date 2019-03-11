class Api::SessionsController < ApplicationController
  def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        jwt = JWT.encode(
          {
            user_id: user.id, 
            exp: 24.hours.from_now.to_i 
          },
          "butter",
          'HS256' 
        )
        render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
      else
        render json: {}, status: :unauthorized
      end
    end

end
