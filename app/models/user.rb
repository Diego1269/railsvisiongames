class User < ApplicationRecord
  belongs_to :privilegio

  has_secure_password

  validates_presence_of :correo
  validates_uniqueness_of :correo
end
