Rails.application.routes.draw do
  devise_for :users
  resources :porfolios, except: [:show]
  get 'angular-items', to: 'porfolios#angular'
  get 'portfolio/:id', to: 'porfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do 
    member do 
      get :toggle_status
    end
  end

  root to: 'pages#home'
 
end
