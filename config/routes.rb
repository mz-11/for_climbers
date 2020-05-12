Rails.application.routes.draw do
  
  get 'user_profile/show'
  get 'posts/new'
  get 'sessions/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/about', to:'pages#about' 
  
  # ログイン用ルーティング設定
  get "/login", to: "sessions#new" #ログインページの取得だけ
  post "/login", to: "sessions#create" #メールアドレスやパスワードのデータをもとにSessionを作成する
  delete "/logout", to: "sessions#destroy"
  
  post '/evaluations', to: 'evaluations#create'
  
  
  # resoucesメソッドはindex,show,new,create,edit,update,destroyのパターン化されたアクションに関するルーティングを一括設定できる。
  resources :users, except: [:index]
  
  #現在ログインしているユーザー自身のプロフィールを表示し、ユーザーidを参照する必要がないため、resourceを使用
  resource :profile #, except: [:destroy]
  
  resources :posts
  

  post 'evaluations', to: 'evaluations#create'
end
