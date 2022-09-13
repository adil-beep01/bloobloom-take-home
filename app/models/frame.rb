class Frame < ApplicationRecord

	CURRENCY_RATE ={
		GBP: 0.86,
		EUR: 0.99,
		JPY: 142.74,
		JOD: 0.71
	}

  enum status: {active: 1, inactive: 0}
	has_many :glasses
end