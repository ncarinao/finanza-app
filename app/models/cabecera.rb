class Cabecera < ApplicationRecord
    validates :id_pago, uniqueness: true
    belongs_to :cliente
end
