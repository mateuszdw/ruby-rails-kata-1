Rails.application.routes.draw do
  resources :authors
  resources :publications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "publications#index"
end
