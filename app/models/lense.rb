class Lense < ApplicationRecord
  CURRENCY_RATE ={
    GBP: 0.86,
    EUR: 0.99,
    JPY: 142.74,
    JOD: 0.71
  }
  enum prescription_type: {fashion: 0, single_vision: 1, varifocals: 2}
  enum lense_type: {classic: 0, blue_light: 1, transition: 2}
  has_many :glasses
end