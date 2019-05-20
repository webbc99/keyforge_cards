Rails.application.routes.draw do

  root 'welcome#home'
  resources :cards
  get 'standard_cards', to: :standard_cards, controller: 'cards'
  get 'all_mavericks', to: :all_mavericks, controller: 'cards'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end