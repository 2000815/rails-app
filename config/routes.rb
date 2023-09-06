Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :infor, only: %i[index show]
      resources :histories, only: %i[index]
    end
  end
end
