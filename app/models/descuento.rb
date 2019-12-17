class Descuento < ApplicationRecord
    validates :id_descuento, uniqueness: true
    belongs_to :cliente
end
