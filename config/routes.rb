Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
    sessions: 'admins/devise/sessions'
  }

  devise_for :tech_providers, controllers: {
    registrations: 'tech_providers/devise/registrations',
    sessions: 'tech_providers/devise/sessions'
  }

  devise_for :tech_seekers, controllers: {
    registrations: 'tech_seekers/devise/registrations',
    sessions: 'tech_seekers/devise/sessions'
  }

  # needs to be AFTER "devise_for :admins" otherwise the admin routes will be messed up
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'home#index'

  authenticate :tech_provider do
    resources :campaigns, only: [:index, :show]
    namespace :dashboard do
      resources :proposed_solutions, only: [:new, :create]
    end
  end

  authenticate :tech_seeker do
    namespace :dashboard do
      resources :campaigns, only: [:index, :show]
    end
  end
end