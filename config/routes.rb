Rails.application.routes.draw do
  get '/stats', to: 'stats#index'
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  scope '/admin' do
    resources :stats, only: [:index]
  end

  resources :posts, only: %i[index show new create edit update]

  root 'posts#index'
end
