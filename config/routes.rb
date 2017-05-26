
Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end
