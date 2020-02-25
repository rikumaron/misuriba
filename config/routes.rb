Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  get 'answers/edit'
  
  resources :questions do
    resources :answers
  end
  
  post '/homes/guest_sign_in', to: 'home#new_guest'
  
  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
