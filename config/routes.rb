Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/devise/registrations',
    sessions: 'users/devise/sessions'
  }

  devise_for :admins, skip: [:registrations], controllers: {
    sessions: 'admins/devise/sessions'
  }

  # needs to be AFTER "devise_for :admins" otherwise the admin routes will be messed up
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  authenticate :user do
    resources :campaigns, only: [:index, :show]
    resources :favorites, only: [:index, :create, :destroy]
    resources :proposed_solutions, only: [:new, :create]
  end
end
