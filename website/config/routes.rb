require "sidekiq/web"

Rails.application.routes.draw do

  namespace :api do
    get "core/information"
    get "core/status"
    get "core/features"
  end

  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => "/sidekiq"
end
