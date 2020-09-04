Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#home'

  get '/:id', to: 'urls#show', as: :show_url
  post '/urls', to: 'urls#create', as: :urls

  get '*unmatched_route', to: 'application#not_found'
end
