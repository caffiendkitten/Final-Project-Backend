class Api::V1::LoginsController < ApplicationController


    def index
        logins = Login.all
        render json: logins, each_serializer: LoginsSerializer
    end

    # def show
    #     login = Login.find(params[:id])
    #     render json: accounts
    # end

    def create
        @login = Login.create(login_params)
    end



    private
    def login_params
      params.require(:login).permit(:username, :password, :account_id)
    end
end
