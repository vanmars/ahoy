Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  resources :outlines
  resources :boards

  get 'home/index'
  get 'home/directions',  to: 'home#directions',  as: 'home_directions'
  get 'home/about',       to: 'home#about',       as: 'home_about'
  get 'home/contact',     to: 'home#contact',     as: 'home_contact'
  get 'home/account',      to: 'home#account',    as: 'home_account'

  get 'random',          to: 'random#new',        as: 'new_random'
  
end
