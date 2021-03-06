class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :set_params, only: [:edit, :update]

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user, serializer: UsersSerializer
    end


    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
            @token = encode_token(user_id: @user.id)
          render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end


    
    def edit
    end
    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end
    



    def set_params
      @user = User.find(params[:id])
    end

    private
      def user_params
        params.require(:user).permit(:username, :password, :email)
      end

      

end
