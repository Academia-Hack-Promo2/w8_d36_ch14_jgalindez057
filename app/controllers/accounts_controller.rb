class AccountsController < ApplicationController
	def index
		@account = Account.all
		render json: @account
	end

	def create
		@new_account = Account.new(parametros)
		if @new_account.save
			render json: "Creada"
		else
			render json: {message: "no creado", errors: @new_account.errors.full_messages}
		end
	end

	def show
		@find_accounts = Account.find(params[:id])
		render json: @find_accounts
	end

	def destroy
		@find_accounts = Account.find(params[:id])
		@delete_accounts = Account.delete(params[:id])
		render json: find_accounts
	end

	def parametros
		params.require(:account).permit(:client_id, :numero_de_cuenta, :tipo_de_cuenta, :monto)
	end
end
