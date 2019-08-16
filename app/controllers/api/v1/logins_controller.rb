class Api::V1::LoginsController < ApplicationController


    def index
        logins = Login.all
        render json: logins, each_serializer: LoginsSerializer
    end

    def show
        login = Login.find(params[:id])
        render json: accounts
    end
end
