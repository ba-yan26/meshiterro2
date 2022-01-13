Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    # 単数形にするとURLに/:idを含まない
    # コメント機能は一つのコメントに複数コメントできる使用だが
    # いいね機能は一人ひとつしかいいねできないため、ユーザIDと投稿ID(post_image)がわかればいい
    resources :post_comments, only: [:create, :destroy]
    # 画像投稿に対してコメントをできるように、post_imageとpost_commentを親子関係にする
  end
  resources :users, only: [:show, :edit, :update]
  # resourcesはルーティングを一括して自動生成してくれる機能
  # onlyオプションを使用することで記述されているアクションだけをルーティングする
  # ルーティングの詳細はrails routesで確認できる
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
