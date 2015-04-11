class Account < ActiveRecord::Base
  belongs_to :client
  has_many :operation
 	
  validates :numero_de_cuenta, :tipo_de_cuenta, :monto, presence: true
  validates :monto, numericality: true 
  validates :numero_de_cuenta, uniqueness: true, length: { is: 20 }
end
