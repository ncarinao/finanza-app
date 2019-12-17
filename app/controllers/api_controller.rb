class ApiController < ApplicationController

  def clientes
    @todosLosClientes = Cliente.all
    render json: @todosLosClientes.as_json(include: [:cabeceras, :transaccions,:descuentos,:footers])  
  end

  def cliente
    @cliente = Cliente.where(codigo: params[:codigo])
    
    if !@cliente.blank?
      cobrado = Transaccion.where(cliente: @cliente[0][:id], tipo: '1').sum(:monto)
      va_a_cobrar = Transaccion.where(cliente: @cliente[0][:id], tipo: '2').sum(:monto)
      render json: {cliente: @cliente,cobrado: cobrado,va_a_cobrar: va_a_cobrar}
    else
      render json: {message: 'Cliente no existe'},status: :internal_server_error
    end
  end

  def transacciones
    @todosLosClientes = Cliente
                        .includes(:transaccions)
                        .where('transaccions.cliente_id not null')
                        .references(:transaccions)
    render json: @todosLosClientes.as_json(include: [:transaccions]), status: :ok
  end


  private
  def parametros
    params.require(:cliente).permit(:codigo)
  end
end
