Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create]
  end

  get '/about' => 'pages#about'
  get '/anks' => 'pages#anks'

  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_error'
  get '/422' => 'errors#unprocessable_entity'

end