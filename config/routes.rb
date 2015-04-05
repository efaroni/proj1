Rails.application.routes.draw do
  #resources :pokemon, as: :capture, path:"pokemon/capture"
  #put 'capture', to: :capture
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  #patch 'capture', to: 'pokemons#capture', as: :capture
  patch '/capture', to: 'pokemons#capture', as:'capture'
  patch '/damage', to: 'pokemons#damage', as:'damage'
  get '/new', to: 'pokemons#new', as:'new'
  post '/create', to: 'pokemons#create', as:'create'
  #patch 'damage', to: 'pokemons#damage', as: :damage

end
