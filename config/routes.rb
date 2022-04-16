Rails.application.routes.draw do
  root "schedule#index"

  devise_for :users do
    resources :schedule
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
