require 'sidekiq/web'

Rails.application.routes.draw do

  scope module: :api, as: :api, constraints: { subdomain: 'api' }, defaults: { format: :json } do
    namespace :v1 do
      post '/sign_up' => 'users/registrations#create'
      post '/sign_in' => 'users/sessions#create'

      resources :users, only: :index do
        get '/self', action: :self, on: :collection
        resources :items, only: :index
      end

      resources :items, only: [:index, :create, :destroy]
    end

    Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
      [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
    end if Rails.env.production?
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'application#index'

end
