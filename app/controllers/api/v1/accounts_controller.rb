class Api::V1::AccountsController < ApplicationController

    def index
        accounts = Account.all
        render json: Account.all, each_serializer: AccountsSerializer
    end

    def show
        account = Account.find(params[:id])
        render json: user
    end

    def create
        @account = Account.create(account_params)
        render json: @account
    end

    def destroy
        delete_account = Account.find(params[:id])
        delete_account.delete
        render json: {message: "success"}
    end



    private
      def account_params
        params.require(:account).permit(:id, :account_name, :user_id)
      end
end
