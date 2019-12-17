class Transaccion < ApplicationRecord
    validates :id_transaccion, uniqueness: true
    belongs_to :cliente
end
