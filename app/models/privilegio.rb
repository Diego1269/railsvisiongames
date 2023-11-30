class Privilegio < ApplicationRecord
  has_many :user
  has_many :usuario
end
