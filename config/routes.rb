Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "posts#index"
    devise_for :users
    
    get 'set_theme', to: 'theme#update'
    
    resources :users
    resources :posts, only: [:show, :index]
    resources :tags, only: [:show]
    resources :categories, only: [:show]
    
    namespace :admin do
      resources :users
      resources :categories, except: [:show]
      resources :posts, except: [:show, :index]
    end
  end
end
