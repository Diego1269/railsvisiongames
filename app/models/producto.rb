class Producto < ApplicationRecord
  belongs_to :categoria
  has_many :detalle_ventum
end
