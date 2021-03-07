Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  match '/users/edit/:id', :to => 'users#edit', :as => :edit, via: [:get]
  match '/users/update', :to => 'users#update', via: [:patch]
  match '/users/leaderboard', :to => 'users#leaderboard', via: [:get]
  match '/users/:id', :to => 'users#show', :as => :user, via: [:get]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
