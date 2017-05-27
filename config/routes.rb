Rails.application.routes.draw do

  get 'movies/', to: 'movies#query'
  get 'worldcup/', to: 'worldcup#query'

  resources :teams
  resources :players
  resources :countries
  resources :users
end
