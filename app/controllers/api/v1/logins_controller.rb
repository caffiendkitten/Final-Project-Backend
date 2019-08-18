class Api::V1::LoginsController < ApplicationController
    skip_before_action :authorized, only: [:create]


    def index
        logins = Login.all
        render json: logins, each_serializer: LoginsSerializer
    end

    def show
        # byebug
        login = Login.find(params[:id])
        # render json: login
        render json: login, serializer: LoginsSerializer

    end

    def create
        # byebug;
        login = Login.create(login_params)
        # byebug
    end



    # private
    def login_params
        # byebug
        params.require(:login).permit(:account_id, :username, :password_digest)
        # byebug
    end
end
