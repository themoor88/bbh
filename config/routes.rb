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

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'       # needs to be AFTER "devise_for :admins" otherwise the admin routes will be messed up

  root to: 'visitors#index'
  resources :campaigns, only: [:index, :show, :new]

  authenticate :tech_provider do
    namespace :dashboard do
      resources :proposed_solutions
    end
  end

  authenticate :tech_seeker do
    namespace :dashboard do
      resources :campaigns
    end
  end
end