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

  root 'home#index'

  authenticate :tech_provider do
    resources :campaigns, only: [:index, :show]
    namespace :dashboard do
      resources :favorites, only: [:index, :create, :destroy]
      resources :proposed_solutions, only: [:new, :create]
    end
  end

  authenticate :tech_seeker do
    namespace :dashboard do
      resources :campaigns, only: [:index, :show]
    end
  end

  authenticated :tech_provider do
    root 'campaigns#index', as: :authenticated_tech_provider_root
  end

  authenticated :tech_seeker do
    root 'dashboard/campaigns#index', as: :authenticated_tech_seeker_root
  end
end
