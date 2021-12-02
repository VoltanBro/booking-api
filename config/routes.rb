# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resource :session, only: %i[create update delete]
      end
    end
  end
end
