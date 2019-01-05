Rails.application.routes.draw do
  get 'users/new'
  get 'signup'  => 'users#new'
  resources :users do
    resources :articles do
      resources :comments
    end
  end

  get 'welcome/index'

  root 'welcome#index'


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
  
end
