require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root to: 'charts#show'
  get '/charts', to: 'charts#index'
  mount Sidekiq::Web => '/sidekiq'

end
