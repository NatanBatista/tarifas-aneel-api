Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root "tarifas#index"
  resources :empresas, only: [:index, :show]
  resources :modalidades_tarifarias, only: [:index]
  resources :tarifas, only: [:index] do
    collection do
      get 'vigenciaempresas/:inicio/:fim', to: 'tarifas#data_vigencia_cnpj'
      get 'descclasse', to: 'tarifas#get_descclasse'
      get 'modalidadesregistro', to: 'tarifas#get_agregado_por_modalidade'
      get 'valortarifapordistribuidora', to: 'tarifas#get_valorTarifaporDistribuidora'
      get 'numtarifasporposto', to: 'tarifas#get_numTarifasPorPosto'
      get 'unidadesconsumidoras', to: 'tarifas#get_unidadesConsumidoras'
      get 'resolucoes', to: 'tarifas#get_resolucao'
      get 'agentestarifas', to: 'tarifas#get_agentes_e_tarifas'
    end
  end
  resources :subgrupos_tarifarios, only: [:index], path: "subgrupos"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
