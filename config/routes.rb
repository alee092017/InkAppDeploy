Rails.application.routes.draw do

  devise_for :users

  resources :pens do
      resources :reviews, except: [:index, :show]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pens#index'

end
