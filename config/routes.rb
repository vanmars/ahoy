Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  resources :outlines

  get 'home/index'
  get 'home/directions',  to: 'home#directions',  as: 'home_directions'
  get 'home/about',       to: 'home#about',       as: 'home_about'
  get 'home/contact',     to: 'home#contact',     as: 'home_contact'

  get '/random',          to: 'random#new',       as: 'new_random'

  get '/play',            to: 'play#new',         as: 'new_play'
  
end
