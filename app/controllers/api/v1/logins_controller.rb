class Api::V1::LoginsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :set_params, only: [:edit, :update]


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

    def destroy
        delete_login = Login.find(params[:id])
        delete_login.delete
        render json: {message: "success"}
    end



    def edit
    end

    def update

        if @logins.update(login_params)
            redirect_to @logins
        else
            render :edit
        end
    end





    # private
    def login_params
        # byebug
        params.require(:login).permit(:account_id, :username, :password_digest)
        # byebug
    end


    def set_params
        @logins = Login.find(params[:id])
    end
end
