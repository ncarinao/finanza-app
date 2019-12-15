class ApiController < ApplicationController

  def clientes
    @todosLosClientes = Cliente.all
    render json: @todosLosClientes.as_json(include: [:cabeceras, :transaccions,:descuentos,:footers])  
  end

  def cliente
    @cliente = Cliente.where(codigo: params[:codigo])
    render json: @cliente.as_json(include: [:cabeceras, :transaccions,:descuentos,:footers])  

  end

  def transacciones
    #@todosLosClientes = Cliente.all
    @todosLosClientes = Cliente
                        .includes(:transaccions)
                        .where('transaccions.cliente_id not null')
                        .references(:transaccions)
    render json: @todosLosClientes.as_json(include: [:transaccions])  
  end


  private
  def parametros
    params.require(:cliente).permit(:codigo)
  end
end
