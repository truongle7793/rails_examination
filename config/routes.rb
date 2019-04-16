Rails.application.routes.draw do
    resources :guides
    resources :reviews

    namespace :api do
        namespace :v1 do
            resources :guides, only: [:show, :index]
        end
    end
end
