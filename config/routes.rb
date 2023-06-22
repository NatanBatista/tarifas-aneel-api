Rails.application.routes.draw do
  root "tarifas#index"
  resources :empresas, only: [:index, :show]
  resources :tarifas, only: [:index] do
    collection do
      get 'vigenciaempresas/:inicio/:fim', to: 'tarifas#data_vigencia_cnpj'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
