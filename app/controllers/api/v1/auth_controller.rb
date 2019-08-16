class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # params: username, password,
        # Find the user with username
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            # user.authenticate(params[:password]) => returns user object, or false
            # Generate token and render to user
            @token = encode_token(user_id: user.id)
            render json: { user: UsersSerializer.new(user), jwt: @token }, status: :created
        else
            # User was not found or password was incorrect,
            # Render error to user
            render json: {error: "ivalid credentials" }, status: :not_acceptable
        end
    end

end