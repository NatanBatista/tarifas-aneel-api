Rails.application.routes.draw do
  root "tarifas#index"
  resources :empresas, only: [:index, :show]
  resources :modalidades_tarifarias, only: [:index]
  resources :tarifas, only: [:index] do
    collection do
      get 'vigenciaempresas/:inicio/:fim', to: 'tarifas#data_vigencia_cnpj'
      get 'descclasse', to: 'tarifas#get_descclasse'
      get 'modalidadesregistro', to: 'tarifas#get_agregado_por_modalidade'
      get 'valortarifapordistribuidora', to: 'tarifas#get_valorTarifaporDistribuidora'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
