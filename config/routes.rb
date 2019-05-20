Rails.application.routes.draw do

  resources :cards

  get 'full_card_list', to: :full_card_list, controller: 'cards'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
