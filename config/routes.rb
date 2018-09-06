Rails.application.routes.draw do
  resources :permission_codes
  resources :workers
  resources :tasks
  resources :jobs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
