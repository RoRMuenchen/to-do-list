Rails.application.routes.draw do
  resources :rewards
  resources :tasks do
    member do
      post 'toggle'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
