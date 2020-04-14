Rails.application.routes.draw do
  root to: 'students#index'
  get 'search', to: 'students#search'
end
