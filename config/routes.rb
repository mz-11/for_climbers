Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/about', to:'pages#about' 
  
  # resoucesメソッドはindex,show,new,create,edit,update,destroyのパターン化されたアクションに関するルーティングを一括設定できる。
  resources :users, except: [:index] #index以外有効
  
  get "/login", to: "sessions#new" #ログインページの取得だけ
  post "/login", to: "sessions#create" #メールアドレスやパスワードのデータをもとにSessionを作成する
  delete "/logout", to: "sessions#destroy"
end
