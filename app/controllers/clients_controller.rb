class ClientsController < ApplicationController
	def index
		@client = Client.all
		render json: @client
	end

	def create
		@new_client = Client.new(parametros)

		if @new_client.save
			render json: "Se ha creado"
		else
			render json: {message: "no creado", errors: @new_client.errors.full_messages}
		end
	end

	def show
		@find_client = Client.find(params[:id])
		render json: @find_client.name
	end

	def update
		@update_client = Client.update(params[:id], parametros)
		render json: @update_client	
	end

	def destroy
		@find_client = Client.find(params[:id])
		@destroy_client = Client.delete(params[:id])
		render json: @find_client
	end

	def accounts
		@find_client = Client.find(params[:client_id])
		render json: {client: @find_client, accounts: @find_client.account}
	end

	def operations
		@find_client2 = Client.find(params[:client_id])
		render json: {client: @find_client2, operations: @find_client2.operation}
	end

	private
	def parametros
		params.require(:client).permit(:name, :last_name, :identify, :address, :local_phone, :phone, :email)
	end
end
