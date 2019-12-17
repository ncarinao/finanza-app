class Cliente < ApplicationRecord
    validates :codigo, uniqueness: true
    has_many :cabeceras
    has_many :descuentos
    has_many :footers
    has_many :transaccions
    accepts_nested_attributes_for :cabeceras, :transaccions, :footers, :descuentos

    def self.insertToDB
        require "rest_client"
        url = "https://increase-transactions.herokuapp.com/file.txt"
        rest_resource = RestClient::Resource.new(url, headers: {'Authorization: Bearer' => '1234567890qwertyuiopasdfghjklzxcvbnm'})

        if !rest_resource.get.body.blank?
            res = rest_resource.get.body.split(/\R+/)
            transacciones = []
            descuentos = []
            cabecera = []
            footer = []
            
            res.each do |operacion|
                case operacion[0]

                when '1'
                    cabecera.push(
                        tipo_de_registro: operacion[0], 
                        id_pago: operacion[1,32], 
                        moneda: operacion[36,3], 
                        monto_total: operacion[39,13], 
                        total_descuentos: operacion[52,13], 
                        total_con_descuentos: operacion[65,13]
                    )
                when '2'
                    transacciones.push(tipo_de_registro: operacion[0], id_transaccion: operacion[1,32], monto: operacion[33,13], tipo: operacion[51])
                when '3'
                    descuentos.push(tipo_de_registro: operacion[0], id_descuento: operacion[1,32], monto: operacion[33,13], tipo: operacion[38])         
                when '4'
                    footer.push(
                        tipo_de_registro: operacion[0], 
                        fecha_de_pago: operacion[16,8], 
                        cliente_codigo: operacion[24,32]
                    )
                    
                    cliente = Cliente.where(codigo: footer[0][:cliente_codigo])
                    puts cliente
                    if !cliente.blank?
                        puts cliente
                        puts 'entra al if '
                        puts cliente[0].id
                        Cliente.update(cliente[0].id,{cabeceras_attributes:cabecera,transaccions_attributes: transacciones,descuentos_attributes:descuentos,footers_attributes: footer})
                    else
                        url = "https://increase-transactions.herokuapp.com/clients/#{footer[0][:cliente_codigo]}"
                        rest_resource = RestClient::Resource.new(url, headers: {'Authorization: Bearer' => '1234567890qwertyuiopasdfghjklzxcvbnm'})

                        if !rest_resource.get.body.nil?
                            puts rest_resource.get.body
                            clienteJSON = JSON.parse(rest_resource.get.body)

                            clienteToInsert = {
                                email: clienteJSON['email'],
                                firstname: clienteJSON['first_name'],
                                lastname: clienteJSON['last_name'],
                                codigo: clienteJSON['id'],
                                job: clienteJSON['job'],
                                country: clienteJSON['country'],
                                address: clienteJSON['address'],
                                zip_code: clienteJSON['zip_code'],  
                                phone: clienteJSON['phone'],  
                                cabeceras_attributes: cabecera,
                                transaccions_attributes: transacciones,
                                descuentos_attributes: descuentos,
                                footers_attributes: footer
                            }   
                            puts 'cliente'
                            Cliente.create!(clienteToInsert)
                        end
                    end
                    transacciones = []
                    descuentos = []
                    cabecera = []
                    footer = []
                end
            end
        end
    end
end
