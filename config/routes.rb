Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'languages/:username' => 'languages#show'
    end
  end
  get 'languages' => 'languages#show'

  root to: 'languages#index'
end
