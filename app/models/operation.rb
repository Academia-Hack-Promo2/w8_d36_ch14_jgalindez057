class Operation < ActiveRecord::Base

  belongs_to :client
  belongs_to :account

  validates :monto_operation, :tipo_de_operacion, presence: true
  validates :cuenta_destino, :cuenta_origen, length: { is: 20 }
  validates :monto_operation, numericality: true

  def self.depositos(monto_operation, cuenta_destino, tipo_de_operacion, find_accounts)
	
	if find_accounts.numero_de_cuenta == cuenta_destino && tipo_de_operacion == 'Deposito' 
    	find_accounts.monto += monto_operation
    	find_accounts.save
	else
		print "No"
  	end
  end

  def self.retiros(cuenta_origen, monto_operation, tipo_de_operacion, find_accounts_retiro)
  	if find_accounts_retiro.numero_de_cuenta == cuenta_origen && tipo_de_operacion == 'Retiro' && find_accounts_retiro.tipo_de_cuenta != 'Depositos a largo plazo' && monto_operation <= find_accounts_retiro.monto
  		find_accounts_retiro.monto -= monto_operation
  		find_accounts_retiro.save
  	else
  		puts "no se pudo"
  	end
  end

  	def self.transferir(cuenta_origen, cuenta_destino, monto_operation, tipo_de_operacion, find_accounts_t, find_accounts_t2)
  		if find_accounts_t.numero_de_cuenta == cuenta_origen && find_accounts_t2.numero_de_cuenta == cuenta_destino && tipo_de_operacion == 'Transferencia' && monto_operation <= find_accounts_t.monto
  			
  			find_accounts_t.monto -= monto_operation
  			find_accounts_t2.monto += monto_operation
  			
  			find_accounts_t.save
  			find_accounts_t2.save
  		else
  			puts "No se puede"
  		end
  	end
end