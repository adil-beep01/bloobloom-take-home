class Frame < ApplicationRecord
  enum status: {active: 1, inactive: 0}
end