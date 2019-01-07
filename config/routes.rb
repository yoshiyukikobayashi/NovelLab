Rails.application.routes.draw do

#reding page configuration

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'users/new'
  get 'signup'  => 'users#new'
  resources :users do
    resources :articles do
      resources :comments
    end
  end

  get 'welcome/index'

  root 'welcome#index'


#mypage configuration

  namespace :mypage do
    resources :users do
      resources :articles do
        resources :comments
      end
    end
  end
  
  post '/mypage/users/:user_id/articles', to: 'mypage/articles#create', as: 'create_mypage_user_article'
  patch '/mypage/users/:user_id/articles/:id', to: 'mypage/articles#update', as: 'update_mypage_user_article'
  
  post '/mypage/users/:user_id/articles/:article_id/comments', to: 'mypage/comments#create', as: 'create_mypage_user_article_comment'
  patch '/mypage/users/:user_id/articles/:article_id/comments/:id', to: 'mypage/comments#update', as: 'update_mypage_user_article_comment'
  
  get '/mypage/users/:user_id/configurations', to: 'mypage/configurations#show', as: 'mypage_user_configuration'
  get '/mypage/users/:user_id/configurations/edit', to: 'mypage/configurations#edit', as: 'edit_mypage_user_configuration'
  patch '/mypage/users/:user_id/configurations', to: 'mypage/configurations#update', as: 'update_mypage_user_configuration'
  
end
