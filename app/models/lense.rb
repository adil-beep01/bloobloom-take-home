class Lense < ApplicationRecord
  enum prescription_type: {fashion: 0, single_vision: 1, varifocals: 2}
  enum lense_type: {classic: 0, blue_light: 1, transition: 2}
end