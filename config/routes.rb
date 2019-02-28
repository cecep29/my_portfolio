Rails.application.routes.draw do
  resources :porfolios, except: [:show]
  get 'portfolio/:id', to: 'porfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
 
end
