Rails.application.routes.draw do
  get 'users/new'
  get 'signup'  => 'users#new'
  #resources :users
  resources :users do
    resources :articles do
      resources :comments
    end
  end
  
  post '/users/:user_id/articles', to: 'articles#create', as: 'create_user_article'
  get 'welcome/index'
  
  #resources :articles
  
  # resources :articles do
  #   resources :comments
  # end
  
  root 'welcome#index'
end
