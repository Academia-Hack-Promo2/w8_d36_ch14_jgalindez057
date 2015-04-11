class OperationsController < ApplicationController
	
	def index
		@operations = Operation.all
		render json: @operations
	end

	def crear_deposito
		@deposito = Operation.new(parametros_depositos)
		@find_accounts = Account.find(parametros_depositos[:account_id])

		if Operation.depositos(parametros_depositos[:monto_operation],
			parametros_depositos[:cuenta_destino], 
			parametros_depositos[:tipo_de_operacion],
			@find_accounts) == true 

			@deposito.save
			render json: "Deposito exitoso"
		else 
			render json: {message: "No se puede crear el deposito", errors: @deposito.errors.full_messages}
		end
	end

	def crear_retiro
		@retiro = Operation.new(parametros_retiros)
		@find_accounts_retiro = Account.find(parametros_retiros[:account_id])

		if Operation.retiros(parametros_retiros[:cuenta_origen],
			parametros_retiros[:monto_operation],
			parametros_retiros[:tipo_de_operacion],
			@find_accounts_retiro) == true

		@retiro.save
		render json: "Retiro exitoso"
		else
			render json: "No se pudo efectuar el deposito"
		end
	end

	def crear_transferencia
		@tranferencia = Operation.new(parametros_transferencias)
		@find_accounts_t = Account.find(params[:account_id])
		@find_accounts_t2 = Account.find(params[:account_id2])

		if Operation.transferir(parametros_transferencias[:cuenta_origen],
			parametros_transferencias[:cuenta_destino],
			parametros_transferencias[:monto_operation],
			parametros_transferencias[:tipo_de_operacion],
			@find_accounts_t, @find_accounts_t2) == true
			@tranferencia.save
			render json: {mensaje: "Se efectuo la tranferencia", 
				cuenta_destino: @tranferencia.cuenta_destino,
				cuenta_origen: @tranferencia.cuenta_origen,
				monto_operation: @tranferencia.monto_operation}
		else
			render json: "No se efectuo"	
		end
	end

	def destroy
		@find_operation = Operation.find(params[:id])
		@eliminar = Operation.delete(params[:id])
		render json:  @find_operation
	end
	
	def parametros_depositos
		params.require(:operation).permit(:client_id, :account_id, :cuenta_destino, :monto_operation, :tipo_de_operacion, :tipo_de_pago)
	end

	def parametros_retiros
		params.require(:operation).permit(:client_id, :account_id, :cuenta_origen, :monto_operation, :tipo_de_operacion)
	end

	def parametros_transferencias
		params.require(:operation).permit(:client_id, :account_id, :account_id2, :cuenta_destino, :cuenta_origen, :monto_operation, :tipo_de_operacion)
	end
end
