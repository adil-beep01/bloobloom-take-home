class Glass < ApplicationRecord
	after_create  :update_stock

  belongs_to    :user
	belongs_to    :frame
	belongs_to    :lense

	private

	def update_stock
		self.lense.update(stock: self.lense.stock - 1)
		self.frame.update(stock: self.frame.stock - 1)
	end
end