Rails.application.routes.draw do
  get 'api/clientes'
  #get 'api/cliente'
  get 'api/cliente/:codigo', to: 'api#cliente', as: 'cliente'
  get 'api/transacciones'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
