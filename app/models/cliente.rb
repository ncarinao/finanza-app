class Cliente < ApplicationRecord
    validates :codigo, uniqueness: true
    has_many :cabeceras
    has_many :descuentos
    has_many :footers
    has_many :transaccions
end
