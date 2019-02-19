Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get 'metadata', to: 'metadata#index'
  get 'marine-spatial-planning', to: 'marine_spatial_planning#index'
  get 'education', to: 'education#index'
  get 'environmental-impact-assessment', to: 'environmental_impact_assessment#index'
  get 'ecosystem-assessment', to: 'ecosystem_assessment#index'
  get 'ecosystem-services', to: 'ecosystem_services#index'
  get 'data-limitations', to: 'data_limitations#index'

  post '/metadata-list', to: 'metadata#metadata_list'
  post '/metadata/download', to: 'metadata#download'
end
