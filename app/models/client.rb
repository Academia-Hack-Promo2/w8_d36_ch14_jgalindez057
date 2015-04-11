class Client < ActiveRecord::Base
	has_many :account
	has_many :operation

	validates :name, :last_name, :identify, :address, :local_phone, :phone, :email, presence: true
	validates :name, :last_name, :address, format: { :with => /\A[a-z A-Z]+\z/}
	validates :name, :last_name, length: { maximum: 15 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :identify, :local_phone, :phone, numericality: true
	validates :identify, :email, uniqueness: true

end
