Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_images, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:show, :edit]
  # resourcesはルーティングを一括して自動生成してくれる機能
  # onlyオプションを使用することで記述されているアクションだけをルーティングする
  # ルーティングの詳細はrails routesで確認できる
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
