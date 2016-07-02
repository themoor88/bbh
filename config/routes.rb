Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/devise/registrations'
  }

  devise_for :admins, skip: [:registrations]

  # needs to be AFTER "devise_for :admins" otherwise the admin routes will be messed up
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticate :user do
    resources :campaigns, only: [:index, :show] do
      member do
        get '/performance' => 'campaigns#performance', as: 'performance'
      end
      resources :proposed_solutions, only: [:new, :create]
      collection do
        get '/search' => 'search#find_campaigns', as: 'search'
      end
    end
    resources :favorites, only: [:index]
    scope '/favorites' do
      post '/add-to-favorites' => 'favorites#add_to_favorites'
      delete '/remove-from-favorites' => 'favorites#remove_from_favorites'
    end
  end

  authenticated :user do
    root to: 'campaigns#index', as: :authenticated_root
  end

  root 'home#index'
end
